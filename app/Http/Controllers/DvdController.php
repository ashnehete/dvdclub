<?php
/**
 * Created by PhpStorm.
 * User: Aashish Nehete
 * Date: 06-Oct-16
 * Time: 14:54
 */

namespace App\Http\Controllers;


use App\Crew;
use App\Dvd;
use App\Genre;
use App\Movie;
use App\TvShow;
use Illuminate\Http\Request;

class DvdController extends Controller
{
    public function getDvd($id) {
        $dvd = Dvd::where('id', $id)->first();
        if ($dvd->dvd_type == 1) $dvd->movie;
        else $dvd->tvshow;
        $dvd->crew;
        $dvd->genres;
//        dd($dvd->toArray());
        return view('dvd.show', $dvd->toArray());
    }

    public function insertDvd(Request $request) {
        $data = $request->all();

        $dvd = new Dvd;
        $dvd->title = $data['title'];
        $dvd->description = $data['desc'];
        $dvd->poster_url = $data['poster'];
        $dvd->issued = -1;

        $type = $data['type'];
        if ($type == "movie") {
            $dvd->dvd_type = 1;
            $dvd->save();

            $movie = new Movie;
            $movie->dvd_id = $dvd->id;
            $movie->release_date = $data['release'];
            $movie->save();
        } else {
            $dvd->dvd_type = 2;
            $dvd->save();

            $tvshow = new TvShow;
            $tvshow->dvd_id = $dvd->id;
            $tvshow->seasons = $data['seasons'];
            $tvshow->episodes = $data['episodes'];
            $tvshow->start_date = $data['start'];
            $tvshow->end_date = $data['end'];
            $tvshow->save();
        }

        foreach ($data['crew'] as $crewid) {
            $dvd->crew()->attach($crewid);
        }
        foreach ($data['genres'] as $genreid) {
            $dvd->genre()->attach($genreid);
        }

        return redirect()->route('insertDvd');
    }

    public function newDvdForm() {
        $crew = Crew::orderBy('name')->get();
        $genres = Genre::orderBy('name')->get();
        return view('dvd.new', [
            'crew' => $crew->toArray(),
            'genres' => $genres->toArray()
        ]);
    }
}