<?php

use Illuminate\Database\Seeder;
use App\Models\Job;

class JobsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $job = new Job;
        $job->title = 'Actor';
        $job->save();

        $job = new Job;
        $job->title = 'Director';
        $job->save();

        $job = new Job;
        $job->title = 'Writer';
        $job->save();

        $job = new Job;
        $job->title = 'Creator';
        $job->save();
    }
}
