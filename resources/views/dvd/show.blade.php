@extends('layouts.container')

@section('body')
    <h1 class="center">{{ $title }}</h1>
    <hr>
    <div class="col-md-6 center">
        <img src="{{ $poster_url }}" alt="{{ $title }}">
        <div>
            @if(Auth::check() && Auth::user()->issue_id == -1)
                @if($issued == -1)
                    <button class="btn btn-default btn-lg" id="issue">Issue</button>
                @else
                    <button class="btn btn-default btn-lg" disabled>Issued</button>
                @endif
            @endif
        </div>
    </div>
    <div class="col-md-6">
        {{ $description }}<br>
        <hr>
        @if($dvd_type == 1)
            Release Date: {{ $movie['release_date'] }}
        @else
            Seasons: {{ $tvshow['seasons'] }}<br>
            Episodes: {{ $tvshow['episodes'] }}<br>
            Start Date: {{ $tvshow['start_date'] }}<br>
            End Date: {{ $tvshow['end_date'] }}<br>
        @endif

        <h3>Crew:</h3>
        @foreach($crew as $crewmember)
            <a href="{{ url('crew/'.$crewmember['id']) }}">{{ $crewmember['name'] }}</a><br>
        @endforeach
    </div>

    @push('scripts')
    <script>
        function issue() {
            alert('issue');
        }
    </script>
    @endpush
@endsection
