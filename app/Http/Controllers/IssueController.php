<?php
/**
 * Created by PhpStorm.
 * User: Aashish Nehete
 * Date: 13-Oct-16
 * Time: 20:38
 */

namespace App\Http\Controllers;

use App\Dvd;
use App\Issue;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IssueController extends Controller
{
    public function issueDvd($id) {
        $user = Auth::user();
        $response = [];

        // Handling errors
        if (!Auth::check()) {
            $response['error'] = 'User not authenticated.';
            return response()->json($response);
        }
        if ($user['issue_id'] != -1) {
            $response['error'] = 'User already issued.';
            return response()->json($response);
        }
        $dvd = Dvd::where('id', $id)->first();
        if ($dvd->issued == 1) {
            $response['error'] = 'Dvd already issued.';
            return response()->json($response);
        }

        $dvd->issued = 1;
        $user->issue_id = $id;

        $issue = new Issue;
        $issue->dvd_id = $id;
        $issue->user_id = $user->id;

        $today = Carbon::now();
        $issue->issue_date = $today->toDateString();
        $issue->due_date = $today->addDays(10)->toDateString();

        $issue->save();
        $dvd->save();
        $user->save();

        $response['dvd_id'] = $id;
        $response['dvd_title'] = $dvd->title;
        $response['user_name'] = $user->name;
        $response['issue_date'] = $today->toDateString();
        $response['due_date'] = $today->addDays(10)->toDateString();
        return response()->json($response);
    }

    public function returnDvd($id) {
        $user = Auth::user();
        $response = [];

        // Handling errors
        if (!Auth::check()) {
            $response['error'] = 'User not authenticated.';
            return response()->json($response);
        }
        if ($user['issue_id'] == -1) {
            $response['error'] = 'User not issued.';
            return response()->json($response);
        }
        $dvd = Dvd::where('id', $id)->first();
        if ($dvd->issued == -1) {
            $response['error'] = 'Dvd not issued.';
            return response()->json($response);
        }

        $dvd->issued = -1;
        $user->issue_id = -1;

        $issue = Issue::where([
            'user_id' => $user->id,
            'dvd_id' => $id,
            'active' => 1
        ])->get();

        if (count($issue) == 0) {
            $response['error'] = 'No issue record found.';
            return response()->json($response);
        } else {
            $issue = $issue[0]; // convert array to object
        }

        $due_date = Carbon::createFromFormat('Y-m-d', $issue->due_date);
        $today = Carbon::now();

        $late_fees = 0;
        if ($today->gt($due_date)) {
            $late_fees = $today->diffInDays($due_date);
        }

        $issue->return_date = $today->toDateString();
        $issue->late_fees = $late_fees;
        $issue->active = 0;

        $issue->save();
        $dvd->save();
        $user->save();

        $response['dvd_id'] = $id;
        $response['dvd_title'] = $dvd->title;
        $response['user_name'] = $user->name;
        $response['return_date'] = $today->toDateString();
        $response['late_fees'] = $late_fees;
        return response()->json($response);
    }
}