<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Kreait\Firebase\Database;
use Kreait\Firebase\Exception\DatabaseException;

class OrderController extends Controller
{
    public function index(Database $database)
    {
       $order = Order::all();

       $ref = $database->getReference("user");

       foreach($order as $index)
       {
           $index->user = json_decode($index->user,true);
           $index->products=json_decode($index->products,true);
           try {
               $index->username = $ref->getChild($index->user_id)->getValue()['user'];
           } catch (DatabaseException $e) {
           }
           try {
               $index->avatar = $ref->getChild($index->user_id)->getValue()['avatar'];
           } catch (DatabaseException $e) {
           }
       }
       return response()->json($order);
    }
}
