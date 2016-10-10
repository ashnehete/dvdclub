@extends('layouts.container')

@section('body')
    <h1 class="center">{{ $name }}</h1>
    <hr>
    <div class="col-md-6 center">
        <img src="{{ $image_url }}" alt="{{ $name }}">
    </div>
    <div class="col-md-6">
        Birth Date: {{ $birth_date }}<br>
        Job: {{ $job['title'] }}<br>

        <h3>Dvds:</h3>
        @foreach($dvds as $dvd)
            <a href="{{ url('dvd/'.$dvd['id']) }}">{{ $dvd['title'] }}</a><br>
        @endforeach
    </div>
@endsection
