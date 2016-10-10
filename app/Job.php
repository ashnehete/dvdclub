<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Job extends Model
{
    public function crew() {
        return $this->hasMany('App\Crew');
    }
}
