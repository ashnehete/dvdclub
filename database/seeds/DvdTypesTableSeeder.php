<?php

use Illuminate\Database\Seeder;
use App\Models\DvdType;

class DvdTypesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $dvdtype = new DvdType;
        $dvdtype->name = 'Movie';
        $dvdtype->save();

        $dvdtype = new DvdType;
        $dvdtype->name = 'TV Show';
        $dvdtype->save();
    }
}
