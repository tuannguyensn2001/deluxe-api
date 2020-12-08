<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CollectionController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\Mobile\ProductAPIController;
use App\Http\Controllers\Mobile\CartAPIController;
use App\Http\Controllers\Mobile\AddressAPIController;
use App\Http\Controllers\Mobile\OrderAPIController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\WithDrawController;
use App\Http\Controllers\Mobile\StatisticController;
use App\Http\Controllers\Mobile\UserAPIController;
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

Route::get('/orders',[OrderController::class,'index']);



//Mobile
Route::get('/mobile/products',[ProductAPIController::class,'index']);
Route::get('/mobile/product/show/{id}',[ProductAPIController::class,'show']);


Route::put('/mobile/cart/add',[CartAPIController::class,'addToCart']);
Route::get('/mobile/cart/show/{id}',[CartAPIController::class,'show']);
Route::put('/mobile/cart/increase',[CartAPIController::class,'increase']);
Route::put('/mobile/cart/decrease',[CartAPIController::class,'decrease']);


Route::get('/mobile/address',[AddressAPIController::class,'index']);
Route::get('/mobile/address/show/{id}',[AddressAPIController::class,'show']);

Route::post('/mobile/order/create',[OrderAPIController::class,'create']);
Route::get('/mobile/order',[OrderAPIController::class,'index']);

Route::put(('/withdraw/edit'),[WithDrawController::class,'edit']);



Route::get('/mobile/statistic/show/{email}',[StatisticController::class,'show']);

Route::post('/mobile/user/edit',[UserAPIController::class,'show']);

