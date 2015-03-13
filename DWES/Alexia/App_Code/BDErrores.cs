using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;

/// <summary>
/// Descripción breve de BDErrores
/// </summary>
public static class BDErrores
{
    public static string MensajeError (SqlException ex) 
    {
        string mensaje = "";

        switch (ex.Number)
        {
            case 547:
                mensaje = "El regitro que se quiere eliminar tiene elementos relacionados";
                break;
            case 2627:
                mensaje = "Registro duplicado";
                break;
            default:
                mensaje = ex.Number + " - " + ex.Message;
                break;
        }

        return (mensaje);
    }
    
}