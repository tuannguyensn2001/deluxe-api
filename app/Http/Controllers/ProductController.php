<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Psy\Util\Str;

class ProductController extends Controller
{
    public function create(Request $request)
    {
        $productRequest = $request->get('product');

        $product = new Product();
        $product->name = $productRequest['name'];
        $product->collection_id=$productRequest['collection_id'];
        $product->thumbnail = $productRequest['thumbnail'];
        $product->promotion = $productRequest['promotion'];
        $product->unit = $productRequest['unit'];
        $product->price = $productRequest['price'];
        $product->description = $productRequest['description'];
        $product->save();

        $attributes = $productRequest['attributes'];
        $table = $product->collection()->first()->attr_table;

        $attributes['product_id']=$product->id;
        $attributes['created_at']=Carbon::now();
        $attributes['updated_at']=Carbon::now();
        $attributes['attribute_id']=\Illuminate\Support\Str::uuid();

        DB::table($table)->insert($attributes);

    }
}
