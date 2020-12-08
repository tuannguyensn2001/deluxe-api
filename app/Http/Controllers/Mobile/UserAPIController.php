<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Controller;
use http\Env\Response;
use Illuminate\Http\Request;
use Kreait\Firebase\Database;
use Kreait\Firebase\Exception\DatabaseException;

class UserAPIController extends Controller
{
    private  $database;

    public function __construct(Database $database)
    {
        $this->database = $database;
    }

    public function show(Request $request): \Illuminate\Http\JsonResponse
    {
        $list = $request->get('lastMessages');

        foreach ($list as &$item)
        {
            $email = $item['email'];
            try {
                $listUser = $this->database->getReference('user')->getValue();

                foreach($listUser as $index){
                    if ($index['email'] === $email){
                        $item['image_url'] = $index['avatar'];
                        $item['username'] = $index['user'];
                    }
                }
            } catch (DatabaseException $e) {
            }

        }

        unset($item);

        return response()->json($list);

    }

    public function searchUser($email)
    {

    }
}
