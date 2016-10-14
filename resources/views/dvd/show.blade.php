@extends('layouts.container')

@section('body')
    <h1 class="center">{{ $title }}</h1>
    <hr>
    <div class="col-md-6 center">
        <img src="{{ $poster_url }}" alt="{{ $title }}">
        <div>
            @if(Auth::check() && Auth::user()->issue_id == -1)
                @if($issued == -1)
                    <button class="btn btn-default btn-lg" onclick="issueDvd({{ $id }})" id="issue">Issue</button>
                @else
                    <button class="btn btn-default btn-lg" disabled>Issued</button>
                @endif
            @endif
        </div>
    </div>
    <div class="col-md-6">
        @foreach($genres as $genre)
            <a href="{{ url('genre/'.$genre['id']) }}">{{ $genre['name'] }}</a>
        @endforeach
        <br>
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
@endsection

@push('scripts')
<script>
    function issueDvd(id) {
        $.ajax({
            url: "{{ url('/issue') }}/" + id,
            success: function (result) {
                if (result.hasOwnProperty("error")) {
                    alert("Error: " + result["error"]);
                } else {
                    var msg = ["Dvd issued successfully.",
                        "Issue Date: " + result["issue_date"],
                        "Due Date: " + result["due_date"]];
                    alert(msg.join("\n"));
                }
                location.reload();
            }
        });
    }
</script>
@endpush

@push('styles')
<style>
    #issue {
        margin: 1em;
    }
</style>
@endpush