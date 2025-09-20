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
        Schema::create('accounts', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('email')->nullable();
            $table->string('password')->nullable();
            $table->foreignId('product_id')->constrained()->onDelete('cascade');
            $table->integer('num_profile');
            $table->boolean('type_account')->default(true)->comment('true = Perfil, false = Cuenta completa');
            $table->boolean('sale_status')->default(false)->comment('true = Vendido, false = No vendido');
            $table->timestamp('date_start');
            $table->timestamp('date_end');
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('accounts');
    }
};
