<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Genre extends Model
{
    public function dvds() {
        return $this->belongsToMany('App\Dvd');
    }
}
