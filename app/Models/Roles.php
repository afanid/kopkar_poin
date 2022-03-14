<?php

namespace App\Models;

use App\Traits\Uuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class Roles extends Model
{
    use HasFactory, SoftDeletes, Uuid;

    public $incrementing = false;

    protected $fillabel = ['id', 'role'];


    protected $casts = [
        'id' => 'string',
    ];

    protected $primaryKey = 'id';

    public function roles(){
        return $this->hasOne(User::class, 'role_id', 'id');
    }

}
