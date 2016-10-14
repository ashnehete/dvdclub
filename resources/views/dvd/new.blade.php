@extends('layouts.container')

@section('body')
    <form class="form-horizontal" role="form" method="POST" action="{{ url('/insertDvd') }}">
        {{ csrf_field() }}

        <div class="form-group">
            <label for="title" class="col-md-4 control-label">Title</label>
            <div class="col-md-6">
                <input id="title" type="text" class="form-control" name="title" value="{{ old('title') }}" required autofocus>
            </div>
        </div>

        <div class="form-group">
            <label for="desc" class="col-md-4 control-label">Description</label>
            <div class="col-md-6">
                <input id="desc" type="text" class="form-control" name="desc" value="{{ old('desc') }}" required>
            </div>
        </div>

        <div class="form-group">
            <label for="poster" class="col-md-4 control-label">Poster Url</label>
            <div class="col-md-6">
                <input id="poster" type="url" class="form-control" name="poster" value="{{ old('poster') }}" required>
            </div>
        </div>

        <div class="form-group">
            <label for="crew" class="col-md-4 control-label">Crew</label>
            <div class="col-md-6">
                <select name="genres[]" class="form-control" multiple>
                    @foreach($genres as $genre)
                        <option value="{{ $genre['id'] }}">{{ $genre['name'] }}</option>
                    @endforeach
                </select>
                Hold <kbd>ctrl</kbd> when selecting multiple genres.<br>
            </div>
        </div>

        <div class="form-group">
            <label for="crew" class="col-md-4 control-label">Crew</label>
            <div class="col-md-6">
                <select name="crew[]" class="form-control" multiple>
                    @foreach($crew as $crewmember)
                        <option value="{{ $crewmember['id'] }}">{{ $crewmember['name'] }}</option>
                    @endforeach
                </select>
                Hold <kbd>ctrl</kbd> when selecting multiple crew members.<br>
                <a href="{{ url('/insertCrew') }}">Add a new crew member.</a>
            </div>
        </div>

        <div class="form-group">
            <label for="poster" class="col-md-4 control-label">Type</label>
            <div class="col-md-6">
                <label class="radio-inline">
                    <input type="radio" name="type" value="movie" checked>Movie
                </label>
                <label class="radio-inline">
                    <input type="radio" name="type" value="tvshow">TV Show
                </label>
            </div>
        </div>

        <div id="movie">
            <div class="form-group">
                <label for="release" class="col-md-4 control-label">Release Date</label>
                <div class="col-md-6">
                    <input id="release" type="date" class="form-control" name="release" value="{{ old('release') }}">
                </div>
            </div>
        </div>

        <div id="tvshow" style="display: none">
            <div class="form-group">
                <label for="seasons" class="col-md-4 control-label">Seasons</label>
                <div class="col-md-6">
                    <input id="seasons" type="number" class="form-control" name="seasons" value="{{ old('seasons') }}">
                </div>
            </div>

            <div class="form-group">
                <label for="episodes" class="col-md-4 control-label">Episodes</label>
                <div class="col-md-6">
                    <input id="episodes" type="number" class="form-control" name="episodes" value="{{ old('episodes') }}">
                </div>
            </div>

            <div class="form-group">
                <label for="start" class="col-md-4 control-label">Start Date</label>
                <div class="col-md-6">
                    <input id="start" type="date" class="form-control" name="start" value="{{ old('start') }}">
                </div>
            </div>

            <div class="form-group">
                <label for="end" class="col-md-4 control-label">End Date</label>
                <div class="col-md-6">
                    <input id="end" type="date" class="form-control" name="end" value="{{ old('end') }}">
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-8 col-md-offset-4">
                <button type="submit" class="btn btn-primary">
                    Insert
                </button>
            </div>
        </div>
    </form>

    @push('scripts')
    <script>
        $("input:radio[name=type]").change(function () {
            var type = $(this).filter(":checked").val();
            console.log(type);
            var movie = $("#movie");
            var tvshow = $("#tvshow");
            if (type === "movie") {
                movie.show();
                tvshow.hide();
            } else {
                tvshow.show();
                movie.hide();
            }
        });
    </script>
    @endpush
@endsection