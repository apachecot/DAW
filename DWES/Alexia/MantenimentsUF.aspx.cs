using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Collections.Specialized;
using System.IO;

public partial class MantenimentsUF : System.Web.UI.Page
{
    static string _where = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            VerGrid();
        }
        else
        {
            EntityDataSourceUF.Where = _where;
        }
    }
    protected void VerGrid()
    {
        EntityDataSourceUF.Where = _where;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        /*
        if (int.Parse(DropDownList1.SelectedValue) == 0)
        {
            _where = "";
            EntityDataSourceUF.Where = _where;
        }
        else
        {
            _where = "it.id_curs = " + DropDownList1.SelectedValue;
            EntityDataSourceUF.Where = _where;
        }
        */
        //GridViewModuls.PageIndex = 0;
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

}