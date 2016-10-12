@extends('layouts.container')

@section('body')
    <h1 class="center">{{ $name }}</h1>
    <hr>
    @foreach($dvds as $dvd)
        <div class="row">
            <div class="col-md-4 center">
                <img src="{{ $dvd['poster_url'] }}" />
            </div>
            <div class="col-md-6">
                <h3><a href="{{ url('dvd/'.$dvd['id']) }}">{{ $dvd['title'] }}</a></h3>
                <p>{{ $dvd['description'] }}</p>
            </div>
        </div>
        <hr>
    @endforeach
@endsection

@push('styles')
<style>
    img {
        height: 200px;
        width: auto;
    }
</style>
@endpush
