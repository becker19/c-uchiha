<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function client()
    {
        return $this->belongsTo(Client::class);
    }

    public function profile()
    {
        return $this->belongsTo(Profile::class);
    }
    public function account()
    {
        return $this->belongsTo(Account::class);
    }

    protected static function booted()
    {
        static::creating(function ($sale) {
            if ($sale->type_account === "0") {
                $account = Account::find($sale->account_id);
                if ($account) {
                    $account->sale_status = true;
                    $account->save();
                }
            } else {
                if ($sale->profile_id) {
                    $profile = Profile::find($sale->profile_id);
                    if ($profile) {
                        $profile->type_account = "0";
                        $profile->save();
                    }
                }
            }
        });
    }
}
