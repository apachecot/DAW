<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Producto
 *
 * @author cep
 */
class Producto extends Eloquent {
    //put your code here
    protected $table = 'productos';
    protected $primaryKey = 'id_producto';
    public $timestamps = false;
    protected $perPage = 10;
    
    public function subtipo()
    {
        return $this->belongsTo('Subtipo', 'id_subtipo');
    }
    
    public static function getProducto($id_producto)
    {
        $producto = Producto::where('id_producto', '=', $id_producto);
        
        return $producto;
    }

}

?>
