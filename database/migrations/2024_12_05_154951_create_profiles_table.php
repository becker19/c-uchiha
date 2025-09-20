<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('profiles', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('pin')->nullable();
            $table->foreignId('account_id')->constrained()->onDelete('cascade');
            // $table->boolean('state')->default(true);
            $table->boolean('type_account')->default(true);
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->timestamp('date_start');
            $table->timestamp('date_end');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('profiles');
    }
};
