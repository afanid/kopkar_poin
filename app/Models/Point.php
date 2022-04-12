<?php

namespace App\Models;

use App\Traits\Uuid;
use Dyrynda\Database\Support\CascadeSoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Str;

class Point extends Authenticatable
{
    use HasFactory, Notifiable, SoftDeletes, CascadeSoftDeletes, Uuid;

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */


    protected $casts = [
        'id' => 'string'
    ];

    protected $guarded = [];

    // public $incrementing = false;

    // In Laravel 6.0+ make sure to also set $keyType
    protected $keyType = 'string';

    protected $primaryKey = 'id';

    protected $cascadeDeletes = ['wallet', 'yearlyLog'];


    public function roles()
    {
        return $this->belongsTo(Roles::class, 'role_id');
    }
    public function wallet()
    {
        return $this->hasOne(Wallet::class, 'user_id');
    }


    public function mainPayment()
    {
        return $this->hasMany(MainPayment::class, 'user_id')->orderBy('created_at', 'ASC');
    }

    public function monthlyPayment()
    {
        return $this->hasMany(MonthlyPayment::class, 'user_id')->orderBy('payment_month', 'ASC');
    }

    public function otherPayment()
    {
        return $this->hasMany(OtherPayment::class, 'user_id')->orderBy('payment_month', 'ASC');
    }

    public function yearlyLog()
    {
        return $this->hasMany(YearlyLog::class, 'user_id');
    }
}
