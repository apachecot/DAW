using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Collections.Specialized;
using System.IO;

public partial class MantenimentModuls : System.Web.UI.Page
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
            EntityDataSourceModulsProf.Where = _where;
        }
    }
    protected void VerGrid()
    {
        //Refrescar la informació de la grid
        //BD.Refrescar("hoteles");
        EntityDataSourceModulsProf.Where = _where;
    }
    protected void DropDownListCicles_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (int.Parse(DropDownListCicles.SelectedValue) == 0)
        {
            _where = "";
            EntityDataSourceModulsProf.Where = _where;
        }
        else
        {
            _where = "it.id_curs = " + DropDownListCicles.SelectedValue;
            EntityDataSourceModulsProf.Where = _where;
        }

        GridViewModuls.PageIndex = 0;
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {

    }
    protected void btnAceptarEsborrar_Click(object sender, EventArgs e)
    {
    
    }
    protected void GridViewModuls_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelTitolModal.Text = "Modificar";   
        //Rellenaras los datos.
        GridViewRow row = GridViewModuls.SelectedRow;

        String id = row.Cells[3].Text;

        moduls_prof modul = BD.ConsultaModul(Convert.ToInt32(id));

        String cicle = modul.cursos.cicles.id.ToString();
        DropDownList2.ClearSelection();
        DropDownList2.Items.FindByValue(cicle).Selected = true;

        String id_curs = modul.id_curs.ToString();
        DropDownList1.ClearSelection();
        DropDownList1.Items.FindByValue(id_curs).Selected = true;


        TextBoxModalCodi.Text = modul.codi.ToString();
        TextBoxModalNom.Text = modul.nom.ToString();
        TextBoxModalHores.Text = modul.hores.ToString();
        TextBoxModalHoresLliures.Text = modul.hores_lliures.ToString();

        if (modul.id_professor != null)
        {
            DropDownListProfesor.ClearSelection();
            DropDownListProfesor.Items.FindByValue(modul.id_professor.ToString()).Selected = true;
        }

        ButtonNou_ModalPopupExtender.Show();
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
             where c.id_cicle==cadena
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
    protected void btnAceptarCrear_Click(object sender, EventArgs e)
    {
        int id_cicle = Convert.ToInt32(DropDownList2.SelectedItem.Value.ToString());
        int id_curs = Convert.ToInt32(DropDownList1.SelectedItem.Value.ToString());
        String codi=TextBoxModalCodi.Text;
        String nom= TextBoxModalNom.Text;
        int hores=Convert.ToInt32(TextBoxModalHores.Text);
        int hores_lliures=Convert.ToInt32(TextBoxModalHoresLliures.Text);
        int id_profesor=Convert.ToInt32(DropDownListProfesor.SelectedItem.Value.ToString());

        BD.Refrescar("moduls_prof");

        String respuesta=BD.AltaModulProfesional(id_cicle, id_curs, codi, nom, hores, hores_lliures, id_profesor);
    
    }
    protected void ButtonNou_Click(object sender, EventArgs e)
    {
        LabelTitolModal.Text = "Crear";
        TextBoxModalCodi.Text = "";
        TextBoxModalNom.Text = "";
        TextBoxModalHores.Text = "";
        TextBoxModalHoresLliures.Text = "";
    }
}