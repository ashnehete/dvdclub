@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h1 class="center">{{ $name }}</h1>
                    </div>

                    <div class="panel-body">
                        @if ($issue_id == -1)
                            No DVD issued
                        @else
                            <div class="row">
                                <div class="col-md-4 center">
                                    <img src="{{ $poster_url }}" />
                                    <div>
                                        <button class="btn btn-default btn-lg" onclick="returnDvd({{ $issue_id }})"
                                                id="return">Return</button>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h3><a href="{{ url('dvd/'.$issue_id) }}">{{ $title }}</a></h3>
                                    <p>{{ $description }}</p>
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
<script>
    function returnDvd(id) {
        $.ajax({
            url: "{{ url('/return') }}/" + id,
            success: function (result) {
                if (result.hasOwnProperty("error")) {
                    alert("Error: " + result["error"]);
                } else {
                    var msg = ["Dvd returned successfully.",
                        "Return Date: " + result["return_date"],
                        "Late Fees: " + result["late_fees"]];
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
    img {
        height: 200px;
        width: auto;
    }

    #return {
        margin: 1em;
    }
</style>
@endpush
