<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of BdErrores
 *
 * @author fran
 */
 class BdErrores {
    //put your code here
    public static function mensaje (Exception $ex)
    {
        $mensaje = "";
        switch ($ex->getCode())
        {
            case 23000:
                $mensaje = "El registro tiene elementos relacionados";
                break;
            default:
                $mensaje = $ex->getCode()." - ".$ex->getMessage();
        }
        
        return $mensaje;
    }
}
