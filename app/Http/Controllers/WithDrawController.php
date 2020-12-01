<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Kreait\Firebase\Database;

class WithDrawController extends Controller
{
    public function edit(Request $request,Database $database)
    {
        $withdraw = $request->get('withdraw');
        $key= $withdraw['key'];
        $ref = $database->getReference("withdraw");
        $money = $withdraw['amount'];
        unset($withdraw['key']);
        if (empty($withdraw['note'])) $withdraw['note'] = '1';
        $ref->getChild($key)->set($withdraw);
        $key = $request->get('key');
        $wallet = $database->getReference('wallet')->getChild($key)->getSnapshot()->getValue();
        $wallet['amount'] -= $money;
        $check = $database->getReference('wallet')->getChild($key)->set($wallet);

        return response()->json($check);
    }
}
