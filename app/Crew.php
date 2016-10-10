<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Crew extends Model
{
    protected $table = 'crew';

    public function job() {
        return $this->belongsTo('App\Job');
    }

    public function dvds() {
        return $this->belongsToMany('App\Dvd');
    }
}
