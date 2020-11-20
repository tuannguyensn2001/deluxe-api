<?php

namespace App\Http\Controllers;

use App\Models\Attributes;
use App\Models\Collection;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CollectionController extends Controller
{
    public function index()
    {
        $collection = Collection::all();
        return response()->json($collection,200);
    }

    public function create(Request $request)
    {

        $collection = new Collection();
        $collection->name = $request->get('name');
        $collection->attr_table = $request->get('table');
        $collection->save();


        $collection_id=$collection->id;
        $table = $collection->attr_table;

        $attributes = $request->get('list');


        $listAttributes = [] ;
        foreach($attributes as $index)
        {
            $item = [];
            $item['collection_id'] = $collection_id;
            $item['name'] = $index['description'];
            $item['code'] = $index['name'];
            $item['data_type'] = $index['data_type'];
            $item['is_required'] = 0;
            $item['created_at'] = Carbon::now();
            $item['updated_at'] = Carbon::now();
            array_push($listAttributes,$item);
        }

        $check = Attributes::insert($listAttributes);

        $query = "CREATE TABLE ".$table." (";
        $query .= "product_id VARCHAR(255),";
        $query .= "attribute_id VARCHAR(255),";
        foreach($attributes as $key=>$index)
        {
            $line = "".$index['name']." ".$this->convert($index['data_type']).",";
            $query .= $line;
        }
        $query .= "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,";
        $query .= "updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ";
        $query .= ")";

        DB::statement($query);

        return response()->json($query);



    }

    public function convert($data)
    {
        $result ="";
        switch ($data)
        {
            case 'int':
                $result = "INT(10)";
                break;
            case 'double':
                $result = "FLOAT(20)";
                break;
            case 'string':
                $result = "VARCHAR(255)";
                break;
            case 'file':
                $result = "VARCHAR(200)";
                break;

        }

        return $result;
    }

    public function show($id)
    {
        $collection = Collection::find($id);
        $attributes = Attributes::where('collection_id','=',$id)->get();
        return response()->json([
            'collection'=>$collection,
            'attributes'=>$attributes,
        ]);
    }

    public function edit(Request $request)
    {
        $id = $request->get('id');
        $collection = $request->get('collection');
        $attributes = $request->get('attributes');
        $table = $collection['attr_table'];

        foreach($attributes as $index)
        {
            if (isset($index['id'])){
                $key = $index['id'];
                $attribute = Attributes::find($key);
                $attribute->name = $index['name'];
                $attribute->code = $index['code'];
                $attribute->data_type = $index['data_type'];
                $attribute->save();
            } else{
                $attribute = new Attributes();
                $attribute->name = $index['name'];
                $attribute->collection_id=$id;
                $attribute->code = $index['code'];
                $attribute->data_type = $index['data_type'];
                $attribute->is_required = 0;
                $attribute->save();
            }
        }
        $columns = Schema::getColumnListing($table);
        $default_attributes = [
            'product_id',
            'attribute_id',
            'created_at',
            'updated_at',
        ];

        $custom_attributes=[];

        foreach($columns as &$index){
            if (!in_array($index,$default_attributes)){
                array_push($custom_attributes,$index);
            }
        }

        $request_attributes = [];

        foreach($attributes as $index){
            array_push($request_attributes,$index['code']);
        }

        $same_attributes = [];

        foreach($custom_attributes as $index){
            if (in_array($index,$request_attributes)){
                array_push($same_attributes,$index);
            }
        }

        $map_attributes_datatype =[];
        foreach($attributes as $index){
            $map_attributes_datatype[$index['code']]=$index['data_type'];
        }

        foreach($custom_attributes as $index){
            if (!in_array($index,$same_attributes)){
                $query = "ALTER TABLE $table ";
                $query .= "DROP COLUMN $index";
                Attributes::where('code','=',$index)->first()->delete();
                DB::statement($query);
            }
        }

        foreach($request_attributes as $index){
            if (!in_array($index,$same_attributes)){
                $type = $this->convert($map_attributes_datatype[$index]);
                $query = "ALTER TABLE $table ";
                $query .= "ADD $index $type ";

                DB::statement($query);
            }
        }


        return response()->json($map_attributes_datatype);




    }
}
