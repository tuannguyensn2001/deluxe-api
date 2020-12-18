<?php

namespace App\Http\Controllers\Mobile;

use App\Date;
use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Kreait\Firebase\Database;

class OrderAPIController extends Controller
{
    public function create(Request $request,Database $database)
    {
        $product = $request->get('product');
        $user = $request->get('user');
        $user_id = $request->get('user_id');
        $money = $request->get('money');


        $order = new Order();
        $order->products = $product;
        $order->user = $user;
        $order->user_id = $user_id;
        $order->money = $money;
        $order->save();

        $product = json_decode($product,true);

        foreach($product as $index)
        {
            $id = $index['id'];
            $cart = Cart::find($id);
            $cart->number = 0;
            $cart->total = 0;
            $cart->save();
        }

        $this->decreaseAmountWallet($user_id,$money,$database);





        return response()->json($request);
    }

    public function index(Database $database)
    {

    }

    private function decreaseAmountWallet($user_id, $money,Database $database)
    {
        $ref = $database->getReference("wallet");
        $key = $user_id;
        $snapshot = $ref->getChild($key);
        $value=$snapshot->getValue();
        $value['amount'] = $value['amount'] - $money;
        $snapshot->set($value);
    }

    public function show($id)
    {
        $order = Order::where('user_id','=',$id)
            ->select('id','money','updated_at')
            ->get();

        foreach ($order as $item)
        {
            $item->update_at = Carbon::parse($item->updated_at)->toString();
        }

        return response()->json($order);
    }

}
