<?php

namespace App\Http\Controllers\Mobile;

use App\DateHelper;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Kreait\Firebase\Database;
use Kreait\Firebase\Exception\DatabaseException;

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
                'money'=>$value
            ];
            unset($this->income[$key]);
            array_push($this->income,$data);

        }

        foreach ($this->pay as $key=>$value)
        {
            $data = [
                'date'=>$key,
                'money'=>$value
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


}
