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

        var comprobar = (from c in contexto.moduls_prof

                      where c.id_curs == id_curs && (c.nom == nom || c.codi==codi)

                      select c).ToList();
        if (comprobar.Count() == 0)
        {

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
        }
        else
        {
            mensaje = "Ja existeix un registre amb el mateix nom o codi";
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
         var comprobar = (from c in contexto.moduls_prof

                      where c.id!=id && c.id_curs == id_curs && (c.nom == nom || c.codi==codi)

                      select c).ToList();
        if (comprobar.Count() == 0)
        {
            try
            {
                contexto.SaveChanges();
            }
            catch (DbUpdateException ex)
            {
                SqlException sqlEx = (SqlException)ex.InnerException.InnerException;
                mensaje = BDErrores.MensajeError(sqlEx);
            }
        }
        else
        {
            mensaje = "Ja existeix un registre amb el mateix nom o codi";
        }
        return (mensaje);
    }

    public static string ModificarNota(int id_uf, int id_alumne,int id_avaluacio, int nota)
    {
        string mensaje = "";

        var notas = (from c in contexto.avaluar

                      where c.id_uf == id_uf 
                      && c.id_alumne==id_alumne
                      && c.id_avaluacio==id_avaluacio
                      select c).ToList();
        if (notas.Count != 0)
        {
            avaluar aval = notas.First();

            aval.id_uf = id_uf;
            aval.id_alumne = id_alumne;
            aval.id_avaluacio = id_avaluacio;
            aval.nota = nota;
        }
        else
        {
            avaluar aval = new avaluar();

            aval.id_uf = id_uf;
            aval.id_alumne = id_alumne;
            aval.id_avaluacio = id_avaluacio;
            aval.nota = nota;
            contexto.avaluar.Add(aval);
        }

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

    public static List<cursos> ConsultaCursos(int id)
    {
        var cursos = (from c in contexto.cursos

                      where c.id_cicle == id

                      select c).ToList();

        return cursos;
    }

    public static moduls_prof ConsultaModul(int id)
    {
        var moduls = (from c in contexto.moduls_prof

                            where c.id == id

                            select c).ToList();

        moduls_prof modul = moduls.First();
        
        return modul;
    }
    public static List<alumnes> ConsultaCursar(int id_uf)
    {
        var alumnes = (from c in contexto.alumnes
                      select c).ToList();
        List<alumnes> alumnes_cursar=new List<alumnes>();
        for (Int32 i = 0; i < alumnes.Count(); i++)
        {
            List<ufs> ufs_alumne=alumnes[i].ufs.ToList();
            for (Int32 j = 0; j < ufs_alumne.Count(); j++)
            {
                if (ufs_alumne[j].id == id_uf)
                {
                    alumnes_cursar.Add(alumnes[i]);
                }
            }
        }
        return alumnes_cursar;
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

         var comprobar = (from c in contexto.ufs

                      where c.id_modul_prof == id_modul && c.nom == nom

                      select c).ToList();
         if (comprobar.Count() == 0)
         {
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
         }
         else
         {
             mensaje = "Ja existeix un registre amb el mateix nom";
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
        var comprobar = (from c in contexto.ufs

                      where c.id_modul_prof == id_modul && c.nom == nom

                      select c).ToList();
         if (comprobar.Count() == 0)
         {
            try
            {
                contexto.SaveChanges();
            }
            catch (DbUpdateException ex)
            {
                SqlException sqlEx = (SqlException)ex.InnerException.InnerException;
                mensaje = BDErrores.MensajeError(sqlEx);
            }
         }
         else
         {
             mensaje = "Ja existeix un registre amb el mateix nom";
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

    public static string EsborrarModul(Exception ex)
    {
        SqlException sqlEx = (SqlException)ex.InnerException;
        return BDErrores.MensajeError(sqlEx);
    }

    public static string EsborrarUF(Exception ex)
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