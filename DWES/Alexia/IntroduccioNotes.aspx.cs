using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Collections.Specialized;
using System.IO;

public partial class IntroduccioNotes : System.Web.UI.Page
{
    static string _where = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // GridViewUF.Visible = false;
        }
        else
        {
            EntityDataSourceAlumnes.Where = _where;
        }
    }
    protected void RefrescarGrid()
    {
        EntityDataSourceAlumnes.Where = _where;
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static AjaxControlToolkit.CascadingDropDownNameValue[] GetDropDownContents(string knownCategoryValues, string category)
    {

        alexiaEntities contexto = new alexiaEntities();

        StringDictionary kv = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);


        List<cicles> ciclos =
            (from c in contexto.cicles
             select c).ToList();

        AjaxControlToolkit.CascadingDropDownNameValue[] resultados = new AjaxControlToolkit.CascadingDropDownNameValue[ciclos.Count];
        AjaxControlToolkit.CascadingDropDownNameValue ciclo;

        int i = 0;

        foreach (cicles item in ciclos)
        {

            ciclo = new AjaxControlToolkit.CascadingDropDownNameValue();

            ciclo.name = item.nom;
            ciclo.value = item.id.ToString();

            resultados[i] = ciclo;

            i++;
        }

        return resultados;
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static AjaxControlToolkit.CascadingDropDownNameValue[] GetDropDownContents2(string knownCategoryValues, string category)
    {

        alexiaEntities contexto = new alexiaEntities();

        StringDictionary detalles = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

        int cadena = Convert.ToInt32(detalles["padreCicle"]);

        List<cursos> cursos =
            (from c in contexto.cursos
             where c.id_cicle == cadena
             select c).ToList();

        AjaxControlToolkit.CascadingDropDownNameValue[] resultados = new AjaxControlToolkit.CascadingDropDownNameValue[cursos.Count];
        AjaxControlToolkit.CascadingDropDownNameValue curso;

        int i = 0;

        foreach (cursos item in cursos)
        {

            curso = new AjaxControlToolkit.CascadingDropDownNameValue();

            curso.name = item.codi;
            curso.value = item.id.ToString();

            resultados[i] = curso;

            i++;
        }

        return resultados;
    }



    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static AjaxControlToolkit.CascadingDropDownNameValue[] GetDropDownContents3(string knownCategoryValues, string category)
    {
        alexiaEntities contexto = new alexiaEntities();

        StringDictionary detalles = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

        int cadena = Convert.ToInt32(detalles["hijoCicle"]);

        List<moduls_prof> modul_prof =
            (from c in contexto.moduls_prof
             where c.id_curs == cadena
             select c).ToList();

        AjaxControlToolkit.CascadingDropDownNameValue[] resultados = new AjaxControlToolkit.CascadingDropDownNameValue[modul_prof.Count];
        AjaxControlToolkit.CascadingDropDownNameValue modul;

        int i = 0;

        foreach (moduls_prof item in modul_prof)
        {

            modul = new AjaxControlToolkit.CascadingDropDownNameValue();

            modul.name = item.nom;
            modul.value = item.id.ToString();

            resultados[i] = modul;

            i++;
        }

        return resultados;
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static AjaxControlToolkit.CascadingDropDownNameValue[] GetDropDownContents4(string knownCategoryValues, string category)
    {
        alexiaEntities contexto = new alexiaEntities();

        StringDictionary detalles = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

        int cadena = Convert.ToInt32(detalles["hijoCurs"]);

        List<ufs> uf =
            (from c in contexto.ufs
             where c.id_modul_prof == cadena
             select c).ToList();

        AjaxControlToolkit.CascadingDropDownNameValue[] resultados = new AjaxControlToolkit.CascadingDropDownNameValue[uf.Count];
        AjaxControlToolkit.CascadingDropDownNameValue uf_cascading;

        int i = 0;

        foreach (ufs item in uf)
        {

            uf_cascading = new AjaxControlToolkit.CascadingDropDownNameValue();

            uf_cascading.name = item.nom;
            uf_cascading.value = item.id.ToString();

            resultados[i] = uf_cascading;

            i++;
        }

        return resultados;
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static AjaxControlToolkit.CascadingDropDownNameValue[] GetDropDownContents5(string knownCategoryValues, string category)
    {
        alexiaEntities contexto = new alexiaEntities();

        StringDictionary detalles = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

        int cadena = Convert.ToInt32(detalles["hijoModul"]);

        List<avaluacions> av =
            (from c in contexto.avaluacions
             select c).ToList();

        AjaxControlToolkit.CascadingDropDownNameValue[] resultados = new AjaxControlToolkit.CascadingDropDownNameValue[av.Count];
        AjaxControlToolkit.CascadingDropDownNameValue aval_cascading;

        int i = 0;

        foreach (avaluacions item in av)
        {

            aval_cascading = new AjaxControlToolkit.CascadingDropDownNameValue();

            aval_cascading.name = item.nom;
            aval_cascading.value = item.id.ToString();

            resultados[i] = aval_cascading;

            i++;
        }

        return resultados;
    }

    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {
        String selected = DropDownList7.SelectedValue.ToString();
        if (selected == "")
        {
            _where = "";
            GridViewAlumnes.Visible = false;
        }
        else
        {
            Int32 id_uf = Convert.ToInt32(DropDownList6.SelectedValue);


            _where = "it.ufs.id = " + id_uf;

            EntityDataSourceAlumnes.Where = _where;
        }

        GridViewAlumnes.PageIndex = 0;
    }
    protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
    {

        String selected = DropDownList7.SelectedValue.ToString();
        if (selected == "")
        {
            _where = "";
            GridViewAlumnes.Visible = false;
        }
        else
        {
            Int32 id_uf = Convert.ToInt32(DropDownList6.SelectedValue);


            _where = "it.ufs.id = " + id_uf;

            EntityDataSourceAlumnes.Where = _where;
        }

        GridViewAlumnes.PageIndex = 0;
    }
}