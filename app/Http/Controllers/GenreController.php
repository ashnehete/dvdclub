<?php
/**
 * Created by PhpStorm.
 * User: Aashish Nehete
 * Date: 11-Oct-16
 * Time: 16:06
 */

namespace App\Http\Controllers;


use App\Dvd;
use App\Genre;

class GenreController
{
    public function getGenre($id) {
        $genre = Genre::where('id', $id)->first();
        $genre->dvds;
//        dd($genre->toArray());
        return view('genre.show', $genre->toArray());
    }
}