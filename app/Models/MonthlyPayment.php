<?php

namespace App\Models;

use App\Traits\Uuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MonthlyPayment extends Model
{
    use HasFactory, SoftDeletes, Uuid;

    // In Laravel 6.0+ make sure to also set $keyType
    public $incrementing = false;

    protected $keyType = 'string';

    protected $primaryKey = 'id';

    protected $guarded = [];

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function configPayment(){
        return $this->belongsTo(ConfigPayment::class, 'config_payment_id', 'id');
    }
}
