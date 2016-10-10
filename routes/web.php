<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::get('/', function () {
    if (Auth::check())
        return redirect('/home');
    else
        return redirect('/login');
});

Auth::routes();

Route::get('/home', 'HomeController@index');

Route::get('/dvd/{id}', 'DvdController@getDvd');
Route::get('/crew/{id}', 'CrewController@getCrew');

// Admin routes
Route::get('/insertDvd', 'DvdController@newDvdForm')->name('insertDvd');
Route::post('/insertDvd', 'DvdController@insertDvd');

Route::get('/insertCrew', 'CrewController@newCrewForm')->name('insertCrew');
Route::post('/insertCrew', 'CrewController@insertCrew');
