<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Tipo
 *
 * @author cep
 */
class Tipo extends Eloquent {
    //put your code here
    protected $table = 'tipos';
    protected $primaryKey = 'id_tipo';
    public $timestamps = false;
    
    public function subtipo()
    {
        return $this->hasMany('Subtipo', 'id_subtipos');
    }
     public function seccion()
    {
        return $this->belongsTo('Seccion', 'id_seccion');
    }
}

?>
