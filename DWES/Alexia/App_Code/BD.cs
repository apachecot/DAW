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
    static alexiaEntities contexto = new alexiaEntities();

    public static string AltaModulProfesional(int id_cicle, int id_curs, string codi, string nom, int hores, int hores_lliures, int id_professor)
    {
        string mensaje = "";

        moduls_prof h = new moduls_prof();

        h.id_curs = id_curs;
        h.codi = codi;
        h.nom = nom;
        h.hores = hores;
        h.hores_lliures = hores_lliures;
        h.id_professor = id_professor;


        contexto.moduls_prof.Add(h);
        try
        {
            contexto.SaveChanges();
        }
        catch (DbUpdateException ex)
        {
            SqlException sqlEx = (SqlException)ex.InnerException.InnerException;
            mensaje = BDErrores.MensajeError(sqlEx);

            contexto.moduls_prof.Remove(h);
        }

        return (mensaje);
    }

    public static string ModificarModulProfesional(int id,int id_cicle, int id_curs, string codi, string nom, int hores, int hores_lliures, int id_professor)
    {
        string mensaje = "";

        var moduls = (from c in contexto.moduls_prof

                      where c.id == id

                      select c).ToList();

        moduls_prof modul = moduls.First();

        modul.id_curs = id_curs;
        modul.codi = codi;
        modul.nom = nom;
        modul.hores = hores;
        modul.hores_lliures = hores_lliures;
        modul.id_professor = id_professor;

        try
        {
            contexto.SaveChanges();
        }
        catch (DbUpdateException ex)
        {
            SqlException sqlEx = (SqlException)ex.InnerException.InnerException;
            mensaje = BDErrores.MensajeError(sqlEx);
        }

        return (mensaje);
    }

    public static moduls_prof ConsultaModul(int id)
    {
        var moduls = (from c in contexto.moduls_prof

                            where c.id == id

                            select c).ToList();

        moduls_prof modul = moduls.First();
        
        return modul;
    }
    public static List<moduls_prof> ConsultaCursModulProf(int id)
    {
        var moduls = (from c in contexto.moduls_prof

                      where c.id_curs == id

                      select c).ToList();


        return moduls;
    }
    public static string AltaUF(int id_modul, string nom)
    {
        string mensaje = "";

        ufs h = new ufs();

        h.id_modul_prof = id_modul;
        h.nom = nom;

        contexto.ufs.Add(h);
        try
        {
            contexto.SaveChanges();
        }
        catch (DbUpdateException ex)
        {
            SqlException sqlEx = (SqlException)ex.InnerException.InnerException;
            mensaje = BDErrores.MensajeError(sqlEx);

            contexto.ufs.Remove(h);
        }

        return (mensaje);
    }
    public static string ModificarUF(int id, int id_modul, string nom)
    {
        string mensaje = "";

        var ufs = (from c in contexto.ufs

                      where c.id == id

                      select c).ToList();

        ufs uf = ufs.First();

        uf.id_modul_prof = id_modul;
        uf.nom = nom;

        try
        {
            contexto.SaveChanges();
        }
        catch (DbUpdateException ex)
        {
            SqlException sqlEx = (SqlException)ex.InnerException.InnerException;
            mensaje = BDErrores.MensajeError(sqlEx);
        }

        return (mensaje);
    }
    public static ufs ConsultaUF(int id)
    {
        var ufs = (from c in contexto.ufs

                      where c.id == id

                      select c).ToList();

        ufs uf = ufs.First();

        return uf;
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
            case "moduls_prof":
                objectContext.Refresh(RefreshMode.StoreWins, contexto.moduls_prof);
                break;
            case "ufs":
                objectContext.Refresh(RefreshMode.StoreWins, contexto.moduls_prof);
                break;
        }
    }

}