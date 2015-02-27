using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Collections.Specialized;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ImageFotos_SlideShowExtender.ContextKey = Request.PhysicalApplicationPath;
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static AjaxControlToolkit.CascadingDropDownNameValue[] GetDropDownContents(string knownCategoryValues, string category)
    {
        aulacepEntities contexto = new aulacepEntities();
        
        List<cicles> ciclos =
            (from c in contexto.cicles
             select c).ToList();

        AjaxControlToolkit.CascadingDropDownNameValue[] resultados = new AjaxControlToolkit.CascadingDropDownNameValue[ciclos.Count];
        int i = 0;

        foreach (cicles item in ciclos)
        {
            AjaxControlToolkit.CascadingDropDownNameValue res = new AjaxControlToolkit.CascadingDropDownNameValue();

            res.name = item.codi;
            res.value = item.id.ToString();

            resultados[i] = res;

            i++;
        }


        return (resultados);
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static AjaxControlToolkit.CascadingDropDownNameValue[] GetDropDownContents2(string knownCategoryValues, string category)
    {
        aulacepEntities contexto = new aulacepEntities();

        StringDictionary kv = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

        int id_ciclo = int.Parse(kv["ciclos"]);

        List<cursos> l_cursos =
            (from c in contexto.cursos
             where c.id_cicle == id_ciclo
             select c).ToList();

        AjaxControlToolkit.CascadingDropDownNameValue[] resultados = new AjaxControlToolkit.CascadingDropDownNameValue[l_cursos.Count];
        int i = 0;

        foreach (cursos item in l_cursos)
        {
            AjaxControlToolkit.CascadingDropDownNameValue res = new AjaxControlToolkit.CascadingDropDownNameValue();

            res.name = item.codi;
            res.value = item.id.ToString();

            resultados[i] = res;

            i++;
        }

        return resultados;
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static AjaxControlToolkit.Slide[] GetSlides(string contextKey)
    {

        

        DirectoryInfo dir = new DirectoryInfo(contextKey + "\\imagenes");
        FileInfo[] ficheros = dir.GetFiles();
        AjaxControlToolkit.Slide[] imagenes = new AjaxControlToolkit.Slide[ficheros.Count()];

        int i = 0;

        foreach (FileInfo item in ficheros)
        {
            AjaxControlToolkit.Slide s = new AjaxControlToolkit.Slide();

            s.ImagePath = "imagenes\\" + item.Name;
            s.Name = item.Name;
            s.Description = item.FullName;

            imagenes[i] = s;

            i++;

        }

        return (imagenes);
    }
}