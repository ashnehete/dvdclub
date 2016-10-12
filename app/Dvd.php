<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Dvd extends Model
{
    public function tvshow() {
        return $this->hasOne('App\TvShow');
    }

    public function movie() {
        return $this->hasOne('App\Movie');
    }

    public function crew() {
        return $this->belongsToMany('App\Crew');
    }

    public function genres() {
        return $this->belongsToMany('App\Genre');
    }
}
