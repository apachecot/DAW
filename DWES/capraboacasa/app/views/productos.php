<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Caprabo a casa - Productos</title>
        <?php
            echo HTML::style('assets/css/metro-bootstrap.min.css');
            echo HTML::style('assets/css/miEstilo.css');
            echo HTML::script('assets/js/jquery-2.1.3.min.js');
            echo HTML::script('assets/js/bootstrap.min.js');
        ?>
</head>
<body>
     <?php require_once 'cabecera.php'; ?>
    <div class="container">
            <div class="btn-toolbar" role="toolbar">
                <a href="<?php echo action('ProductosController@mostrarAltaProductos'); ?>" class="btn btn-default">
                  <span class="glyphicon glyphicon-plus"></span> Nuevo Producto
                </a>
                <p class="label label-danger"></p>
            </div>
            <br />
        </div>
     <div class="container">
            <div id="PanelGrid" runat="server" class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Productos</h3>
                </div>
                <div class="panel-body">
                    <?php echo Form::open(array('action'=>'ProductosController@buscarProductosBusqueda')) ?>
                    <div class="form-group">
                        <?php echo Form::label('seccion', 'Seccion', array('class' => 'col-lg-1 col-sm-2 col-xs-2 control-label'));?>
                        <div class="col-lg-10 col-sm-10 col-xs-10">
                            <?php echo Form::select('seccion', $secciones, $id_seccion, array('class' => 'form-control', 'onChange'=>'this.form.submit()'));?> 
                        </div>
                        <?php echo Form::label('tipo', 'Tipo', array('class' => 'col-lg-1 col-sm-2 col-xs-2 control-label'));?>
                        <div class="col-lg-10 col-sm-10 col-xs-10">
                            <?php echo Form::select('tipo', $tipos, $id_tipo, array('class' => 'form-control', 'onChange'=>'this.form.submit()'));?> 
                        </div>
                        <?php echo Form::label('subtipo', 'Subtipo', array('class' => 'col-lg-1 col-sm-2 col-xs-2 control-label'));?>
                        <div class="col-lg-10 col-sm-10 col-xs-10">
                            <?php echo Form::select('subtipo', $subtipos, $id_subtipo, array('class' => 'form-control', 'onChange'=>'this.form.submit()'));?> 
                        </div>                     
                    </div>
                    <?php echo Form::close(); ?>
                    <table class="table table-striped table-hover ">
                        <thead>
                          <tr>
                            <th></th>
                            <th>Descripción</th>
                            <th>Subtipo</th>
                            <th>Tipo</th>
                            <th>Sección</th>
                          </tr>
                        </thead>
                        <tbody>
                        <?php
                                foreach ($productos as $producto)
                                {
                                    echo '<tr>';

                                    echo '<td><img src="'.$producto->imagen_producto.'" height="42" width="42"></td>';
                                    echo '<td>'.$producto->desc_producto.'</td>';
                                    echo '<td>'.$producto->subtipo->desc_subtipo.'</td>';
                                    echo '<td>'.$producto->subtipo->tipo->desc_tipo.'</td>';
                                    echo '<td>'.$producto->subtipo->tipo->seccion->desc_seccion.'</td>';
                                    echo '</td>';
                                    echo '<td class="colBotones">';
                                    echo '<div class="btn-toolbar" role="toolbar">';
                                    echo '<a href="'.action('ProductosController@borrarProducto',array($producto->id_producto)).'" class ="btn btn-default btn-xs">';
                                    echo '<span class="glyphicon glyphicon-trash"></span> Eliminar</a>';


                                    echo '<a href="'.action('ProductosController@mostrarEditarProducto',array($producto->id_producto)).'" class ="btn btn-default btn-xs">';
                                    echo '<span class="glyphicon glyphicon-pencil"></span> Editar</a>';

                                    echo '</div>';

                                    echo '</td>';
                                    echo '</tr>';
                                }
                            ?>
                            </table>
                    <?php echo $productos->links(); ?>
                </div>
            </div>
        </div>
</body>
</html>
