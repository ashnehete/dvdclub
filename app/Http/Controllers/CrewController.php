<?php
/**
 * Created by PhpStorm.
 * User: Aashish Nehete
 * Date: 10-Oct-16
 * Time: 12:51
 */

namespace App\Http\Controllers;


use App\Job;
use App\Crew;
use Illuminate\Http\Request;

class CrewController extends Controller
{
    public function getCrew($id) {
        $crew = Crew::where('id', $id)->first();
        $crew->job;
        $crew->dvds;
//        dd($crew->toArray());
        return view('crew.show', $crew->toArray());
    }

    public function insertCrew(Request $request) {
        $data = $request->all();

        $crew = new Crew;
        $crew->name = $data['name'];
        $crew->birth_date = $data['birth'];
        $crew->image_url = $data['image'];
        $crew->job_id = $data['job'];
        $crew->save();

        return redirect()->route('insertCrew');
    }

    public function newCrewForm() {
        $jobs = Job::all();
//        dd($jobs->toArray());
        return view('crew.new', [
            'jobs' => $jobs->toArray()
        ]);
    }
}