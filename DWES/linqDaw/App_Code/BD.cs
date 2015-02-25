using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de BD
/// </summary>
static public class BD
{
    static aulacepEntities contexto = new aulacepEntities();

    public static string AltaCurso(int id, string codi, string descripcion, int id_cicle)
    {
        string mensaje = "";
        cursos cur = new cursos();

        cur.id = id;
        cur.codi = codi;
        cur.descripcio = descripcion;
        cur.id_cicle = id_cicle;

        contexto.cursos.Add(cur);
        try
        {
            contexto.SaveChanges();
        }
        catch (DbUpdateException ex)
        {
            SqlException sqlEx = (SqlException)ex.InnerException.InnerException;

            mensaje = BDErrores.Mensaje(sqlEx);
        }

        return (mensaje);
    }

}