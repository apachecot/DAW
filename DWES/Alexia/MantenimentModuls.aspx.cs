﻿using System;
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
        //Rellenaras los datos.
        GridViewRow row = GridViewModuls.SelectedRow;

       // DropDownList2.ClearSelection();
        // DropDownList2.Items.FindByValue("2").Selected = true;

        Label id_cicle = (Label)row.Cells[3].FindControl("LabelCodiGrid");
        if (id_cicle.Text != "" && id_cicle.Text != null)
        {
            DropDownList1.ClearSelection();
            DropDownList1.Items.FindByText(id_cicle.Text).Selected = true;
        }

        TextBoxModalCodi.Text = row.Cells[4].Text;
        TextBoxModalNom.Text = row.Cells[5].Text;
        TextBoxModalHores.Text = row.Cells[6].Text;
        TextBoxModalHoresLliures.Text = row.Cells[7].Text;

        if (row.Cells[8].Text != "&nbsp;" && row.Cells[8].Text != null)
        {
            DropDownListProfesor.ClearSelection();
            DropDownListProfesor.Items.FindByValue(row.Cells[8].Text).Selected = true;
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


    }
}