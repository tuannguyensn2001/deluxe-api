<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Controller;
use App\Models\Address;
use Illuminate\Http\Request;

class AddressAPIController extends Controller
{
    public function index()
    {
        $address = Address::all();
        return response()->json($address);
    }

    public function show($id)
    {
        $address = Address::where('user_id','=',$id)
            ->first();
        return response()->json($address,200);
    }
}
