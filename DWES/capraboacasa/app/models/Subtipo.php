<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Subtipo
 *
 * @author cep
 */
class Subtipo extends Eloquent {
    //put your code here
    protected $table = 'subtipos';
    protected $primaryKey = 'id_subtipo';
    public $timestamps = false;
    
     public function producto()
    {
        return $this->hasMany('Producto', 'id_producto');
    }
     public function tipo()
    {
        return $this->belongsTo('Tipo', 'id_tipo');
    }
}

?>
