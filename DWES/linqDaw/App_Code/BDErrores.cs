using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;

/// <summary>
/// Descripción breve de BDErrores
/// </summary>
static public class BDErrores
{
    public static string Mensaje(SqlException sqlEx)
    {
        string mensaje = "";

        switch (sqlEx.Number)
        {
            case 547:
                mensaje = "No se puede borrar el registro porque tiene otros relacionados";
                break;
            case 2627:
                mensaje = "Registro duplicado";
                break;
            default:
                mensaje = sqlEx.Number + " - " + sqlEx.Message;
                break;
        }

        return mensaje;
    }
}