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
            GridViewUF.Visible = false;
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
        if (int.Parse(DropDownList1.SelectedValue) == 0)
        {
            _where = "";
            EntityDataSourceUF.Where = _where;
        }
        else
        {
            Int32 id_curs = Convert.ToInt32(DropDownList1.SelectedValue);
            List<moduls_prof> moduls = BD.ConsultaCursModulProf(id_curs);
            if (moduls.Count() == 0)
            {
                GridViewUF.Visible = false;
            }
            else
            {
                GridViewUF.Visible = true;
            }
            for (Int32 i = 0; i < moduls.Count(); i++)
            {
                if (i == 0)
                {
                    _where = "it.id_modul_prof = " + moduls[i].id;
                }
                else
                {
                    _where = _where + " or it.id_modul_prof = " + moduls[i].id;
                }
            }
            EntityDataSourceUF.Where = _where;
        }

        GridViewUF.PageIndex = 0;
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {

    }
    protected void btnAceptarEsborrar_Click(object sender, EventArgs e)
    {

    }
    protected void GridViewUF_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelTitolModal.Text = "Modificar";
        //Rellenaras los datos.
        GridViewRow row = GridViewUF.SelectedRow;

        String id = row.Cells[2].Text;

        LabelIdModificar.Text = id;

        ufs uf = BD.ConsultaUF(Convert.ToInt32(id));

        String nom = uf.nom.ToString();
        TextBoxNomUF.Text=nom;

        String cicle = uf.moduls_prof.cursos.id_cicle.ToString();
        DropDownList3.ClearSelection();
        DropDownList3_CascadingDropDown.SelectedValue = cicle;

        String id_curs = uf.moduls_prof.id_curs.ToString();
        DropDownList4.ClearSelection();
        DropDownList4_CascadingDropDown.SelectedValue = id_curs;

        String id_modul = uf.id_modul_prof.ToString();
        DropDownList5.ClearSelection();
        DropDownList5_CascadingDropDown.SelectedValue = id_modul;

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
    protected void btnAceptarCrear_Click(object sender, EventArgs e)
    {
        if (this.IsValid)
        {
            int id_cicle = Convert.ToInt32(DropDownList3.SelectedItem.Value.ToString());
            int id_curs = Convert.ToInt32(DropDownList4.SelectedItem.Value.ToString());
            int id_modul = Convert.ToInt32(DropDownList5.SelectedItem.Value.ToString());
            String nom = TextBoxNomUF.Text;
            

            if (LabelTitolModal.Text == "Crear")
            {
                String respuesta = BD.AltaUF(id_modul, nom);
                if (respuesta != "")
                {
                    LabelErrorBD.Text = respuesta;
                    ButtonNou_ModalPopupExtender.Show();
                }
                else
                {
                    LimpiarPopUp();
                }
            }
            else
            {
                int id = Convert.ToInt32(LabelIdModificar.Text);
                String respuesta = BD.ModificarUF(id,id_modul, nom);
                if (respuesta != "")
                {
                    LabelErrorBD.Text = respuesta;
                    ButtonNou_ModalPopupExtender.Show();
                }
                else
                {
                    LimpiarPopUp();
                }
            }

            BD.Refrescar("ufs");
            VerGrid();
        }
        else
        {
            ButtonNou_ModalPopupExtender.Show();
        }
    }
    public void LimpiarPopUp()
    {
        LabelTitolModal.Text = "Crear";
        DropDownList3_CascadingDropDown.SelectedValue = "1";
        DropDownList4_CascadingDropDown.SelectedValue = "1";
        DropDownList5_CascadingDropDown.SelectedValue = "1";
        TextBoxNomUF.Text = "";
        LabelErrorBD.Text = "";
    }
    protected void btnCerrarCrear_Click(object sender, EventArgs e)
    {
        LimpiarPopUp();
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
}