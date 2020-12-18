<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Controller;
use App\Models\Address;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AddressAPIController extends Controller
{
    public function index(): \Illuminate\Http\JsonResponse
    {
        $address = Address::all();
        return response()->json($address);
    }

    public function show($id): \Illuminate\Http\JsonResponse
    {
//        $address = Address::where('user_id','=',$id)
//            ->first();
//        return response()->json($address,200);
        $password = "hahaha";
        $password = Hash::make($password);
        return response()->json($password);
    }

    public function edit(Request  $request): \Illuminate\Http\JsonResponse
    {
        $user_id = $request->get('user_id');
        $address = Address::where('user_id','=',$user_id)->first();
        $address->fullname = $request->get('fullname');
        $address->phone = $request->get('phone');
        $address->address = $request->get('address');

        $address->save();

        return response()->json($address);
    }


}
