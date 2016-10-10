@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">{{ $name }}</div>

                <div class="panel-body">
                    @if ($issue_id == -1)
                    No DVD issued
                    @else
                    DVD issued:
                        <a href="{{ url('dvd/'.$issue_id)  }}">{{ $issue_id }}</a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
