<?php

namespace App\Http\Controllers;

use App\Models\Collection;
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
        $product->collection_id = $productRequest['collection_id'];
        $product->thumbnail = $productRequest['thumbnail'];
        $product->promotion = $productRequest['promotion'];
        $product->unit = $productRequest['unit'];
        $product->price = $productRequest['price'];
        $product->description = $productRequest['description'];
        $product->save();

        $attributes = $productRequest['attributes'];
        $table = $product->collection()->first()->attr_table;

        $attributes['product_id'] = $product->id;
        $attributes['created_at'] = Carbon::now();
        $attributes['updated_at'] = Carbon::now();
        $attributes['attribute_id'] = \Illuminate\Support\Str::uuid();

        DB::table($table)->insert($attributes);

        return response()->json('',200);

    }

    public function index()
    {
        return response()->json(Product::all(),200);
    }

    public function show($id)
    {

        return response()->json($this->getDetailsProduct($id),200);
    }

    private function getDetailsProduct($id)
    {
        $product = Product::find($id);

        $product->collection = $product->collection()->first()->name;
        $table = Collection::find($product->collection_id)->attr_table;

        $attributes = DB::table($table)
            ->where('product_id', '=', $product->id)
            ->get();

        foreach ($attributes as $index) {
            unset($index->product_id, $index->created_at, $index->updated_at, $index->attribute_id);
        }

//        $product->attributes= $attributes;

        unset($product->user_id);

        return $product;
    }

    public function edit(Request $request)
    {
       $requestProduct = $request->get('product');
       $id = $requestProduct['id'];
       $product = Product::find($id);
       $product->name = $requestProduct['name'];
       $product->collection_id=$requestProduct['collection_id'];
       $product->price=$requestProduct['price'];
       $product->thumbnail=$requestProduct['thumbnail'];
       $product->promotion=$requestProduct['promotion'];
       $product->unit=$requestProduct['unit'];
       $product->description=$requestProduct['description'];
       $product->save();

       $table = $product->collection()->first()->attr_table;

       DB::table($table)
           ->where('product_id','=',$product->id)
           ->update($requestProduct['attributes'][0]);


       return response()->json('',200);
    }

}
