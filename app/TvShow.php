<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TvShow extends Model
{
    public function dvd() {
        return $this->belongsTo('App\Dvd');
    }
}
