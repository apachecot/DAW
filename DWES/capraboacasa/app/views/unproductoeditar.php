<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Caprabo a casa - Editar producto</title>
        <?php
            echo HTML::style('assets/css/metro-bootstrap.min.css');
            echo HTML::style('assets/css/miEstilo.css');
            echo HTML::script('assets/js/jquery-2.1.3.min.js');
            echo HTML::script('assets/js/bootstrap.min.js');
        ?>
    </head>
    <body>
        
        <?php include 'cabecera.php'; ?>
        
         <?php echo Form::open(array('action'=>'ProductosController@editarProducto', 'class'=>'form-horizontal')) ?>
        <div class="container">
            <div id="PanelHotel" class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Editar producto</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <?php echo Form::hidden('id_producto', $id_producto, array('id_producto' => $id_producto)); ?>
                        <?php echo Form::label('Label3', 'Descripción', array('class' => 'col-lg-2 col-sm-2 control-label'));?>
                        <div class="col-lg-10  col-sm-10 col-md-10">
                            <?php echo Form::text('desc_producto', $producto->desc_producto, array('class' => 'form-control')); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <?php echo Form::label('Label4', 'Precio', array('class' => 'col-lg-2 col-sm-2 control-label'));?>
                        <div class="col-lg-10  col-sm-10 col-md-10">
                            <?php echo Form::text('precio_producto', $producto->precio_producto, array('class' => 'form-control')); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <?php echo Form::label('seccion', 'Sección', array('class' => 'col-lg-1 col-sm-2 col-xs-2 control-label'));?>
                        <div class="col-lg-10 col-sm-10 col-xs-10">
                            <?php echo Form::select('seccion', $secciones, null, array('class' => 'form-control'));?> 
                        </div>
                    </div>
                    <div class="form-group">
                        <?php echo Form::label('tipo', 'Tipo', array('class' => 'col-lg-1 col-sm-2 col-xs-2 control-label'));?>
                        <div class="col-lg-10 col-sm-10 col-xs-10">
                            <?php echo Form::select('tipo', $tipos, null, array('class' => 'form-control'));?> 
                        </div>
                    </div>
                    <div class="form-group">
                        <?php echo Form::label('subtipo', 'Subtipo', array('class' => 'col-lg-1 col-sm-2 col-xs-2 control-label'));?>
                        <div class="col-lg-10 col-sm-10 col-xs-10">
                            <?php echo Form::select('subtipo', $subtipos, $producto->id_subtipo, array('class' => 'form-control'));?> 
                        </div>
                    </div>
                    <div class="form-group">
                        <?php echo Form::label('label_image', 'Imagen', array('class' => 'col-lg-1 col-sm-2 col-xs-2 control-label'));?>
                        <div class="col-lg-10 col-sm-10 col-xs-10">                       
                            <?php echo Form::file('image'); ?>
                        </div>
                    </div>
                        
                        
                    <div class="form-group">
                        <div class="col-lg-10 col-sm-10 col-lg-offset-2 col-sm-offset-2">
                            <a id="buttonCancelar" href="/capraboacasa/public/productos" class="btn btn-default">
                                <span class="glyphicon glyphicon-remove"></span> Cancelar
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <span class="glyphicon glyphicon-ok"></span> Aceptar
                            </button>
                             <?php if(!empty($mensaje))
                                {
                                    echo '<a style="color:red">'.$mensaje.'</a>';
                                }
                             ?>
                            <!--<asp:Label ID="LabelMensajesHot" runat="server" CssClass="text-danger"></asp:Label>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php echo Form::close(); ?>           
    </body>
</html>
