<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Controller;
use App\Models\Attributes;
use App\Models\Collection;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductAPIController extends Controller
{
    public function index()
    {
        $collection = Collection::all();
        foreach ($collection as $index) {
           $index->products = Product::query()
               ->where('collection_id','=',$index->id)
               ->get();
        }

        return response()->json($collection);
    }

    public function show($id)
    {
        $product = Product::find($id);
        $table = $product->collection()->first()->attr_table;
        $result_attributes = null;
        $attributes = DB::table($table)
            ->where('product_id','=',$id)
            ->get();

        foreach ($attributes as $index)
        {
            unset($index->product_id);
            unset($index->attribute_id);
            unset($index->created_at);
            unset($index->updated_at);
            $result_attributes = get_object_vars($index);
        }

        $product->attributes = $this->convert($result_attributes,$product->collection_id);
        $product->collection = $product->collection()->first()->name;

        return response()->json($product);
    }

    private function convert($attribute,$collection_id)
    {
        $result = [];
        foreach ($attribute as $key=>$index)
        {
            $item['code'] = $key;
            $item['name'] = Attributes::query()
                ->where([
                    ['collection_id','=',$collection_id],
                    ['code','=',$key]
                ])->first()->name;
            $item['value'] = $index;
            $result[] = $item;
        }

        return $result;
    }


}
