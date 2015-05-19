<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Seccion
 *
 * @author cep
 */
class Seccion extends Eloquent {
    protected $table = 'secciones';
    protected $primaryKey = 'id_seccion';
    public $timestamps = false;
    
    public function tipo()
    {
        return $this->hasMany('Tipo', 'id_tipo');
    }
}

?>
