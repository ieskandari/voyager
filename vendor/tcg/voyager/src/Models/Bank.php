<?php

namespace TCG\Voyager\Models;


use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;

class Bank extends Model
{
    use Translatable;

    protected $translatable = [ 'name' ,'description'];

    protected $table = 'banks';

    protected $fillable = [ 'name','description'];

    public function documnet()
    {
        return $this->hasMany(Voyager::modelClass('Documnet'))
            ->published()
            ->orderBy('created_at', 'DESC');
    }
} 
