<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Recipe extends Model
{
    use HasFactory;
    public $timestamps = false;
    public function favoredBy()
    {
        return $this->belongsToMany(User::class, 'favourites', 'id_recipes', 'id_users');
    }
}
