<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Account extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function profiles()
    {
        return $this->hasMany(Profile::class);
    }
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
