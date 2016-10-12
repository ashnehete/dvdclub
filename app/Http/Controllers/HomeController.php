<?php

namespace App\Http\Controllers;

use App\Dvd;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Auth::user();
        if ($user['issue_id'] == -1)
            return view('home', $user);
        else {
            $id = $user['issue_id'];
            $dvd = Dvd::where('id', $id)->first();
            $data = array_merge($user->toArray(), $dvd->toArray());
//            dd($data);
            return view('home', $user->toArray(), $dvd->toArray());
        }
    }
}
