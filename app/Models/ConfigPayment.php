<?php

namespace App\Models;

use App\Traits\Uuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ConfigPayment extends Model
{
    use HasFactory, SoftDeletes, Uuid;

    // In Laravel 6.0+ make sure to also set $keyType
    protected $keyType = 'string';

    protected $primaryKey = 'id';

    protected $guarded = [];

    public function mainPayment(){
        return $this->hasMany(MainPayment::class, 'config_payment_id', 'id');
    }
}
