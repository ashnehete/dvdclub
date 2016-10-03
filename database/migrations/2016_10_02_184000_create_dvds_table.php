<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDvdsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dvds', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title');
            $table->integer('dvd_type')->unsigned()->index();
            $table->foreign('dvd_type')->references('id')->on('dvd_types')->onDelete('cascade');
            $table->string('description')->nullable();
            $table->boolean('issued');
            $table->string('poster_url');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('dvds');
    }
}
