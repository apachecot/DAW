using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Data.Objects;

/// <summary>
/// Descripción breve de BD
/// </summary>
public static class BD
{
    static hoteles_basicoEntities contexto = new hoteles_basicoEntities();

    public static string AltaHotel(int id_ciudad, string nombre, string cif, int categoria, string direccion, int telefono, string tipo)
    {
        string mensaje = "";

        hoteles h = new hoteles();

        h.id_ciudad = id_ciudad;
        h.nombre = nombre;
        h.cif = cif;
        h.categoria = categoria;
        h.direccion = direccion;
        h.telefono = telefono;
        h.tipo = tipo;

        contexto.hoteles.Add(h);
        try
        {
            contexto.SaveChanges();
        }
        catch (DbUpdateException ex)
        {
            SqlException sqlEx = (SqlException)ex.InnerException.InnerException;
            mensaje = BDErrores.MensajeError(sqlEx);

            contexto.hoteles.Remove(h);
        }

        return (mensaje);
    }

    public static string EsborrarHotel(Exception ex)
    {
        SqlException sqlEx = (SqlException)ex.InnerException;
        return BDErrores.MensajeError(sqlEx);
    }

    public static void Refrescar(string entitat)
    {
        ObjectContext objectContext = ((IObjectContextAdapter)contexto).ObjectContext;

        switch (entitat)
        {
            case "hoteles":
                objectContext.Refresh(RefreshMode.StoreWins, contexto.hoteles);
                break;
        }
    }

}