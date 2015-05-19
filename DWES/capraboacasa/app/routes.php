<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', function()
{
	return View::make('inicio');
});


Route::get('/productos', 'ProductosController@buscarProductos');
Route::post('/productos', 'ProductosController@buscarProductosBusqueda');
Route::get('productos/alta', 'ProductosController@mostrarAltaProductos');
Route::post('productos/alta', 'ProductosController@altaProductos');
Route::get('productos/borrar/{id_producto}', 'ProductosController@borrarProducto');
Route::get('productos/editar/{id_producto}', 'ProductosController@mostrarEditarProducto');
Route::post('productos/editar/{id_producto}', 'ProductosController@editarProducto');