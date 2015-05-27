<?php

class ProductosController extends BaseController {
    
        private function crearSecciones($secciones)
        {
           $seccionesArray = array();
           $seccionesArray[0] = "Todas";
           foreach ($secciones as $seccion)
           {
               $seccionesArray[$seccion->id_seccion] = $seccion->desc_seccion;
           }

           return $seccionesArray;
        }
        private function crearTipos($tipos)
        {
           $tiposArray = array();
           $tiposArray[0] = "Todas";
           foreach ($tipos as $tipo)
           {
               $tiposArray[$tipo->id_tipo] = $tipo->desc_tipo;
           }

           return $tiposArray;
        }
        private function crearSubtipos($subtipos)
        {
           $subtiposArray = array();
           $subtiposArray[0] = "Todas";
           foreach ($subtipos as $subtipo)
           {
               $subtiposArray[$subtipo->id_subtipo] = $subtipo->desc_subtipo;
           }

           return $subtiposArray;
        }
        
        public function mostrarAltaProductos()
        {
            $datos['secciones']=  $this->crearSecciones(Seccion::all());
            $datos['tipos']=  $this->crearTipos(Tipo::all());
            $datos['subtipos']=  $this->crearSubtipos(Subtipo::all());

            return View::make('unproducto', $datos);
        }
        
        public function altaProductos()
        {
            $mensaje = "";

            $input = Input::all();

            $producto = new Producto();
            $file="";
            if(!empty($input['image']))
            {
                $file = "Imatges/Productos/".$input['image'];
            }
            //Input::file('image')->move($destinationPath, $fileName);
            if(!empty($input['descripcion']))
            {
                $producto->desc_producto = $input['descripcion'];
            }else
            {
                $mensaje="Faltan campos obligatorios";
            }
            if(!empty($input['precio']) && $mensaje=="")
            {
                $producto->precio_producto = $input['precio'];
            }
            else
            {
                $mensaje="Faltan campos obligatorios";
            }
            if($input['subtipo']!=0 && $mensaje=="")
            {
                $producto->id_subtipo = $input['subtipo'];
            }
            else
            {
                $mensaje="Faltan campos obligatorios";
            }
            
            $producto->imagen_producto = $file;
            
            if($mensaje=="")
            {
                try
                {
                    $producto->save();
                }
                catch (Exception $ex)
                {
                    $mensaje = BdErrores::mensaje($ex);
                }
            }
            if ($mensaje != "")
            {
                $datos['secciones']=  $this->crearSecciones(Seccion::all());
                $datos['tipos']=  $this->crearTipos(Tipo::all());
                $datos['subtipos']=  $this->crearSubtipos(Subtipo::all());
                $datos['mensaje']=$mensaje;
                return View::make('unproducto', $datos);
            }
            else
            {
                return Redirect::action('ProductosController@buscarProductos');
            }

        
        }

	public function mostrarProductos($id_seccion,$id_tipo,$id_subtipo)
	{
            
             $datos['secciones']=  $this->crearSecciones(Seccion::all());

             $datos['productos']=  Producto::paginate();
             $datos['id_seccion']=0;
             $datos['id_tipo']=0;
             $datos['id_subtipo']=0;
             if($id_seccion=="" || $id_seccion==0)
             {
                 $tiposArray = array();
                 $tiposArray[0] = "Sin datos";
                 $datos['tipos']=$tiposArray;
                 $id_tipo=0;
                 $id_subtipo=0;
             }else{
                 $datos['id_seccion']=$id_seccion;
                 $datos['tipos']=  $this->crearTipos(Tipo::where('id_seccion', '=', $id_seccion)->get());
             }
             if($id_tipo=="" || $id_tipo==0)
             {
                 $subtiposArray = array();
                 $subtiposArray[0] = "Sin datos";
                 $datos['subtipos']=$subtiposArray;
                 $id_subtipo=0;
                 
             }else{
                 $datos['id_tipo']=$id_tipo;
                 $datos['subtipos']=  $this->crearSubtipos(Subtipo::where('id_tipo', '=', $id_tipo)->get());
             }
             if($id_subtipo!="" && $id_subtipo!=0)
             {
                $datos['id_subtipo']=$id_subtipo;
                $datos['productos']=  Producto::where('id_subtipo', '=', $id_subtipo)->paginate();
             }     
            return $datos;
	}
        public function borrarProducto($id_producto)
        {
            $mensaje = "";
            try 
            {
                $fila = Producto::getProducto($id_producto)->delete();
            }
            catch (Exception $ex) 
            {
                $mensaje = BdErrores::mensaje($ex);
            }
            return Redirect::action('ProductosController@buscarProductos');
        }
        public function buscarProductos()
        {
             $datos = $this->mostrarProductos("","","");
        
             return View::make('productos', $datos);
        }
         public function buscarProductosBusqueda()
        {
             $input = Input::all();
             $seccion=$input['seccion'];
             $tipo=$input['tipo'];
             $subtipo=$input['subtipo'];
             $datos = $this->mostrarProductos($seccion,$tipo,$subtipo);
        
             return View::make('productos', $datos);
        }
        public function mostrarEditarProducto($id_producto)
        {
            $producto = Producto::getProducto($id_producto)->first();

            $datos['id_producto']=$id_producto;
            $datos['producto'] = $producto;
            $datos['secciones']=  $this->crearSecciones(Seccion::all());
            $datos['tipos']=  $this->crearTipos(Tipo::all());
            $datos['subtipos']=  $this->crearSubtipos(Subtipo::all());

            return View::make('unproductoeditar', $datos);
        }
        public function editarProducto()
        {  
            $input = Input::all();
            $file="";
            if(!empty($input['image']))
            {
                $file = "Imatges/Productos/".$input['image'];
            }
            
            $modificacion = array (
           'desc_producto' => $input['desc_producto'],
           'precio_producto' => $input['precio_producto'],
           'id_subtipo' => $input['subtipo'],
           'imagen_producto' => $file
           );

           $producto = Producto::getProducto($input['id_producto'])
                       ->update($modificacion);

            return Redirect::action('ProductosController@buscarProductos');
        }

}
