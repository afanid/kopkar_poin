<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Withdraw extends Model
{
    use HasFactory, SoftDeletes;

    // In Laravel 6.0+ make sure to also set $keyType
    protected $keyType = 'string';

    protected $primaryKey = 'id';

    protected $guarded = [];
}
