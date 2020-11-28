<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Product;
use Illuminate\Http\Request;

class CartAPIController extends Controller
{
    public function addToCart(Request $request)
    {
        $user_id = $request->get('user_id');
        $product_id = $request->get('product_id');
        $product = Product::find($product_id);

        $cart = Cart::query()
            ->where([
                ['user_id','=',$user_id],
                ['product_id','=',$product_id],
            ])->first();


        if (empty($cart))
        {
            $cart = new Cart();
            $cart->user_id = $user_id;
            $cart->product_id = $product_id;
            $cart->number = 1;
            $cart->total = $product->price;
            $cart->save();
        }
        else if($cart->number ==0)
        {
            $cart->number = 1;
            $cart->total = $product->price;
            $cart->save();
        }
        else{
            $total = $cart->total;
            $number = $cart->number;
            $price = $total/$number;
            $number++;
            $cart->number = $number;
            $cart->total = $price * $number;
            $cart->save();
        }


        return response()->json([$cart]);


    }

    public function increase(Request $request)
    {
        $id = $request->get('id');
        $cart = Cart::find($id);
        $total = $cart->total;
        $number = $cart->number;
        $price = $total/$number;
        $number++;
        $cart->number = $number;
        $cart->total = $price * $number;
        $cart->save();
        $cart->product = $cart->product()->first();

        return response()->json($cart,200);

    }

    public function decrease(Request $request)
    {
        $id = $request->get('id');
        $cart = Cart::find($id);

        $total = $cart->total;
        $number = $cart->number;
        $price = $total/$number;
        $number--;
        $cart->number = $number;
        $cart->total = $price * $number;
        $cart->save();

        if ($number > 0){
            $cart->product = $cart->product()->first();
        } else{
            $cart = null;
        }

        return response()->json($cart,200);
    }

    public function show($id)
    {
        $cart = Cart::where('user_id','=',$id)
            ->where('number','!=',0)
            ->get();
        foreach ($cart as $index)
        {
            $index->product = $index->product()->first();
        }

        return response()->json($cart,200);
    }

}
