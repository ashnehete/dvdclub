<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCrewDvdPivotTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('crew_dvd', function (Blueprint $table) {
            $table->integer('crew_id')->unsigned()->index();
            $table->foreign('crew_id')->references('id')->on('crew')->onDelete('cascade');
            $table->integer('dvd_id')->unsigned()->index();
            $table->foreign('dvd_id')->references('id')->on('dvds')->onDelete('cascade');
            $table->primary(['crew_id', 'dvd_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('crew_dvd');
    }
}
