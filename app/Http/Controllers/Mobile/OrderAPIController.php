<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class OrderAPIController extends Controller
{
    public function create(Request $request)
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

        return response()->json($request);
    }

}
