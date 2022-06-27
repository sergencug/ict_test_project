<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', 'App\Http\Controllers\KayitController@index');
Route::post('/post/get_models', 'App\Http\Controllers\KayitController@get_models');
Route::post('/post/get_place', 'App\Http\Controllers\KayitController@get_place');
Route::post('/post/save_service', 'App\Http\Controllers\KayitController@store');

