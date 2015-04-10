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
             GridViewAlumnes.Visible = false;
        }
        else
        {
            EntityDataSourceAlumnes.Where = _where;
        }
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
        RefrescarGrid();
    }
    protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
    {
        RefrescarGrid();
    }

    protected void GridViewAlumnes_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridViewAlumnes.Rows[e.RowIndex];

        TextBox nota = ((TextBox)(row.Cells[5].FindControl("TextBoxNotes")));

        Int32 id_uf = Convert.ToInt32(DropDownList6.SelectedValue);
        Int32 id_avaluacio = Convert.ToInt32(DropDownList7.SelectedValue);
        Int32 id_alumne =  Convert.ToInt32(row.Cells[1].Text.ToString());
        Int32 nota_final = Convert.ToInt32(nota.Text.ToString());
        BD.ModificarNota(id_uf, id_alumne, id_avaluacio, nota_final);

    }

    public void RefrescarGrid()
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
            Int32 id_avaluacio = Convert.ToInt32(DropDownList7.SelectedValue);
            List<alumnes> alumnes = BD.ConsultaCursar(id_uf);
            if (alumnes.Count() == 0)
            {
                GridViewAlumnes.Visible = false;
            }
            else
            {
                GridViewAlumnes.Visible = true;
            }
            for (Int32 i = 0; i < alumnes.Count(); i++)
            {
                if (i == 0)
                {
                    _where = "it.persones.id = " + alumnes[i].id;
                }
                else
                {
                    _where = _where + " or it.persones.id = " + alumnes[i].id;
                }
            }
            EntityDataSourceAlumnes.Where = _where;
            for (Int32 i = 0; i < alumnes.Count(); i++)
            {
                List<avaluar> av = alumnes[i].avaluar.ToList();
                Label nota = ((Label)(GridViewAlumnes.Rows[i].Cells[5].FindControl("LabelNota")));
                nota.Text = "";
                for (Int32 j = 0; j < av.Count(); j++)
                {
                    if (av[j].id_avaluacio == id_avaluacio)
                    {
                        nota.Text= av[j].nota.ToString();
                    }
                }
            }
        }
        GridViewAlumnes.PageIndex = 0;
    }
}