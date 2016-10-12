<?php
/**
 * Created by PhpStorm.
 * User: Aashish Nehete
 * Date: 13-Oct-16
 * Time: 00:51
 */

namespace App\Http\Controllers;


use App\Crew;
use App\Dvd;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function get(Request $request) {
        $q = $request->all()['q'];
        $dvds = Dvd::where('title', 'LIKE', '%'.$q.'%')->get();
        $crew = Crew::where('name', 'LIKE', '%'.$q.'%')->get();
//        dd([
//            'q' => $q,
//            'dvds' => $dvds->toArray(),
//            'crew' => $crew->toArray(),
//        ]);
        return view('search.search', [
            'q' => $q,
            'dvds' => $dvds->toArray(),
            'crew' => $crew->toArray(),
        ]);
    }
}