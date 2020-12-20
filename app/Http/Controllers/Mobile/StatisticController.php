<?php

namespace App\Http\Controllers\Mobile;

use App\DateHelper;
use App\Http\Controllers\Controller;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Kreait\Firebase\Database;
use Kreait\Firebase\Exception\DatabaseException;
use function GuzzleHttp\Psr7\str;

class StatisticController extends Controller
{
    private $database;
    private $date;
    private $email;
    private $listDeposit;
    private $listIncomeTransfer;
    private $pay;
    private $income;
    private $listWithDraw;
    private $listPayTransfer;
    public function __construct(Database $database,DateHelper $dateHelper)
    {
        $this->database = $database;
        $this->date = $dateHelper;

    }

    public function show($email): \Illuminate\Http\JsonResponse
    {
        $this->email = $email;
        $this->income = [];
        $this->pay=[];

        $this->setIncome();
        $this->setPay();



        foreach ($this->income as $key=>$value)
        {
            $data = [
                'date'=>$key,
                'money'=>$value,
            ];
            unset($this->income[$key]);
            array_push($this->income,$data);

        }

        foreach ($this->pay as $key=>$value)
        {
            $data = [
                'date'=>$key,
                'money'=>$value,
            ];
            unset($this->pay[$key]);
            array_push($this->pay,$data);

        }

        $data=[];
        $data['income'] = $this->income;
        $data['pay'] = $this->pay;

        return response()->json($data);


    }

    public function setPay()
    {
        $this->getListWithDraw();

        $this->pay = $this->convert($this->listWithDraw,$this->pay,'amount','update_at');

        $this->getListPayTransfer();

        $this->pay=$this->convert($this->listPayTransfer,$this->pay,'money','updated_at');
    }
    public function setIncome()
    {
        $this->getListDeposit();

        $this->income = $this->convert($this->listDeposit,$this->income,'money','updated_at');

        $this->getListIncomeTransfer();

        $this->income = $this->convert($this->listIncomeTransfer,$this->income,'money','updated_at');
    }

    public function convert($list,$income,$typeMoney,$typeDate)
    {

        foreach ($list as $value)
        {
            $date = $this->date->convertMonthYear($value[$typeDate]);

            if (!isset($income[$date])){
                $income[$date] = 0;
            }
            $income[$date] += $value[$typeMoney];
        }
        return $income;
    }

    public function getListDeposit()
    {
        $list = null;
        try {
            $list = $this->database->getReference('deposit')->getValue();
        } catch (DatabaseException $e) {

        }

        $result = [];

        foreach ($list as $key=>$value)
        {
            if ($value['email'] === $this->email)
            {
                $result[$key] = $value;
            }
        }

        $this->listDeposit = $result;

    }

    public function getListIncomeTransfer()
    {
        $list = null;
        try {
            $list = $this->database->getReference('transfer')->getValue();
        } catch (DatabaseException $e) {
        }

        $result = [];

        foreach ($list as $key=>$value)
        {
            if ($value['emailReceiver'] === $this->email)
            {
                $result[$key] = $value;
            }
        }

        $this->listIncomeTransfer = $result;
    }

    public function getListWithDraw()
    {
        $list = null;
        try {
            $list = $this->database->getReference('withdraw')->getValue();
        } catch (DatabaseException $e) {

        }

        $result = [];

        foreach ($list as $key=>$value)
        {
            if ($value['email'] === $this->email && $value['is_active'])
            {
                $result[$key] = $value;
            }
        }

        $this->listWithDraw = $result;
    }

    public function getListPayTransfer()
    {
        $list = null;
        try {
            $list = $this->database->getReference('transfer')->getValue();
        } catch (DatabaseException $e) {
        }

        $result = [];

        foreach ($list as $key=>$value)
        {
            if ($value['emailDepositor'] === $this->email)
            {
                $result[$key] = $value;
            }
        }

        $this->listPayTransfer = $result;
    }


    public function count($id,Request  $request)
    {
       $option = $request->query('option') ? $request->query('option') : 'limit';
       $unit = $request->query('unit') ? $request->query('unit') : 'month';

       if ($option === 'limit' && $unit === 'month') {
           $this->countLimitMonth($id);
       }

    }

    public function countLimitMonth($id,$money): array
    {
        try {
            $user = $this->database->getReference('user')->getChild($id)->getValue();
            $email = $user['email'];
            $month = Carbon::now()->shortEnglishMonth;
            $year = Carbon::now()->year;


            $listTransfer = $this->getListTransfer($email,$month,$year,$money);

            $listOrder = $this->getListOrder($id,$email,$money);

            return array_merge($listTransfer,$listOrder);


        } catch (DatabaseException $e) {
        }

    }

    public function getListTransfer($email,$month,$year,$money): array
    {
        $result = [];
        try {
            $transfer = $this->database->getReference('transfer')->getValue();

            if ($money === null){
                foreach ($transfer as $key=>$item)
                {

                    $created_at = $item['created_at'];

                    if (str_contains($created_at,$month) && str_contains($created_at,$year) && $item['emailDepositor'] === $email){
                        $index['id'] = $key;
                        $index['money'] = $item['money'];
                        $index['created_at'] = $item['created_at'];
                        $index['email'] = $email;
                        $index['type'] = 1;

                        $result[] = $index;

                    }
                }
            } else{
                foreach ($transfer as $key=>$item)
                {
                    $created_at = $item['created_at'];
                    if (str_contains($created_at,$month) && str_contains($created_at,$year) && $item['emailDepositor'] === $email && $item['money'] > $money){
                        $index['id'] = $key;
                        $index['money'] = $item['money'];
                        $index['created_at'] = $item['created_at'];
                        $index['email'] = $email;
                        $index['type'] = 1;

                        $result[] = $index;

                    }
                }
            }




            return $result;


        } catch (DatabaseException $e) {
        }
    }

    public function getListOrder($id,$email,$money): array
    {
        $order = Order::query()
            ->where('user_id','=',$id)
            ->whereMonth('created_at','=',date('m'))
            ->whereYear('created_at','=',date('Y'))
            ->get();

        $result = [];

        if ($money === null) {
            foreach($order as $item){
                $index['id'] = $item->id;
                $index['money'] = $item->money;
                $index['created_at'] = Carbon::parse($item->created_at)->toString();
                $index['email'] = $email;
                $index['type'] = 2;
                $result[] = $index;
            }
        } else{
            foreach($order as $item){
               if ($item->money > $money) {
                   $index['id'] = $item->id;
                   $index['money'] = $item->money;
                   $index['created_at'] = Carbon::parse($item->created_at)->toString();
                   $index['email'] = $email;
                   $index['type'] = 2;
                   $result[] = $index;
               }
            }
        }

        return $result;

    }

    public function showAllInMonth($id): \Illuminate\Http\JsonResponse
    {
        return response()->json($this->countLimitMonth($id,null));
    }

    public function LimitInMonth($id): \Illuminate\Http\JsonResponse
    {
        try {
            $money = $this->database->getReference('wallet')->getChild($id)->getValue()['perLimitForTransaction'];
            return response()->json($this->countLimitMonth($id,$money));
        } catch (DatabaseException $e) {
        }
    }


}
