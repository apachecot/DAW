using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Image1_SlideShowExtender.ContextKey = Request.PhysicalApplicationPath;
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

        return imagenes;
    }
}