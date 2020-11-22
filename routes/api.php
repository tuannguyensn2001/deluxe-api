<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CollectionController;
use App\Http\Controllers\ProductController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/collection',[CollectionController::class,'index']);
Route::post('/collection/create',[CollectionController::class,'create']);
Route::get('/collection/show/{id}',[CollectionController::class,'show']);
Route::put('/collection/edit',[CollectionController::class,'edit']);
Route::delete('/collection/delete',[CollectionController::class,'delete']);
Route::get('/collection/details',[CollectionController::class,'details']);

Route::get('/product',[ProductController::class,'index']);
Route::get('/product/show/{id}',[ProductController::class,'show']);
Route::post('/product/create',[ProductController::class,'create']);
Route::put('/product/edit',[ProductController::class,'edit']);
