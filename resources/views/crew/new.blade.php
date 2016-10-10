@extends('layouts.container')

@section('body')
    <form class="form-horizontal" role="form" method="POST" action="{{ url('/insertCrew') }}">
        {{ csrf_field() }}

        <div class="form-group">
            <label for="name" class="col-md-4 control-label">Name</label>
            <div class="col-md-6">
                <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus>
            </div>
        </div>

        <div class="form-group">
            <label for="birth" class="col-md-4 control-label">Birth Date</label>
            <div class="col-md-6">
                <input id="birth" type="date" class="form-control" name="birth" value="{{ old('birth') }}" required>
            </div>
        </div>

        <div class="form-group">
            <label for="image" class="col-md-4 control-label">Image Url</label>
            <div class="col-md-6">
                <input id="image" type="url" class="form-control" name="image" value="{{ old('image') }}" required>
            </div>
        </div>

        <div class="form-group">
            <label for="image" class="col-md-4 control-label">Job</label>
            <div class="col-md-6">
                <select name="job" class="form-control">
                    @foreach($jobs as $job)
                    <option value="{{ $job['id'] }}">{{ $job['title'] }}</option>
                    @endforeach
                </select>
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
@endsection