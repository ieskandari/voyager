<?php

namespace TCG\Voyager\Models;


use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;

class Documnet extends Model
{
    use Translatable;

    protected $translatable = [ 'accountside_id' ,'bank_id','bed','bes','sanad_date'];

    protected $table = 'Documnets';

    protected $fillable = [ 'accountside_id' ,'bank_id','bed','bes','sanad_date' ];

    public function accountsideId()
    {
        return $this->belongsTo(Voyager::modelClass('Accountside'));
    }
    public function bankId()
    {
        return $this->belongsTo(Voyager::modelClass('Bank'));
    }
}
