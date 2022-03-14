<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('role_id');
            $table->string('member_id')->nullable();
            $table->string('email')->nullable();
            $table->string('username');
            $table->string('password');
            $table->string('name');
            $table->string('phone_number');
            $table->string('address')->nullable();
            $table->tinyInteger('is_banned')->default(0);
            $table->string('status')->nullable();
            $table->tinyInteger('main_payment_status')->default(0);
            $table->date('registered_at');
            $table->string('tmt')->nullable();

            $table->softDeletes();
            $table->timestamps();

            $table->foreign('role_id')->references('id')->on('roles');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
