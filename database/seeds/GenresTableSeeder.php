<?php

use Illuminate\Database\Seeder;
use App\Models\Genre;

class GenresTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $genre = new Genre;
        $genre->name = 'Comedy';
        $genre->save();

        $genre = new Genre;
        $genre->name = 'Romance';
        $genre->save();

        $genre = new Genre;
        $genre->name = 'Thriller';
        $genre->save();

        $genre = new Genre;
        $genre->name = 'Horror';
        $genre->save();

        $genre = new Genre;
        $genre->name = 'Action';
        $genre->save();
    }
}
