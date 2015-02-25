using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hoteles : System.Web.UI.Page
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
            //BD.Refrescar("hoteles");
            EntityDataSourceHoteles.Where = _where;
        }
    }

    protected void VerAlta()
    {
        PanelGrid.Visible = false;
        PanelHotel.Visible = true;
        LabelMensajesHot.Text = "";
    }

    protected void VerGrid()
    {
        PanelGrid.Visible = true;
        PanelHotel.Visible = false;
        LabelMensajeGrid.Text = "";
        
        //Refrescar la informació de la grid
        BD.Refrescar("hoteles");
        EntityDataSourceHoteles.Where = _where;
    }

    protected void ButtonAlta_Click(object sender, EventArgs e)
    {
        VerAlta();
        BorrarDatos(PanelHotel.Controls);
    }

    private void BorrarDatos(ControlCollection lista)
    {
        foreach (Control item in lista)
        {
            if (item is TextBox)
            {
                TextBox t = (TextBox)item;
                t.Text = "";
            }
            else if (item is DropDownList)
            {
                DropDownList d = (DropDownList)item;
                d.SelectedIndex = -1;
            }
            else if (item is Label)
            {
                Label l = (Label)item;
                if (l.ID == "LabelMensajesHot")
                {
                    l.Text = "";
                }
            }

        }
    }
    protected void ButtonCancelar_Click(object sender, EventArgs e)
    {
        VerGrid();
    }
    protected void ButtonAceptar_Click(object sender, EventArgs e)
    {
        if (ValidarHotel())
        {

            LabelMensajesHot.Text = BD.AltaHotel(int.Parse(DropDownListCiudades.SelectedValue),
                                                    TextBoxNombre.Text, DropDownListCadenas.SelectedValue,
                                                    int.Parse(TextBoxCategoria.Text), TextBoxDireccion.Text,
                                                    int.Parse(TextBoxTelefono.Text), DropDownListTipo.SelectedValue.ToUpper());
            if (LabelMensajesHot.Text == "")
            {
                VerGrid();
            }
        }
    }

    private bool ValidarHotel()
    {
        bool valido = true;
        int telefono;

        if (!int.TryParse(TextBoxTelefono.Text, out telefono))
        {
            valido = false;
            LabelMensajesHot.Text = "El teléfono ha de ser numérico";
            TextBoxTelefono.Focus();
        }

        return (valido);
    }
    protected void DropDownListCiudadesBus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (int.Parse(DropDownListCiudadesBus.SelectedValue) == 0)
        {
            _where = "";
            EntityDataSourceHoteles.Where = _where;
        }
        else
        {
            _where = "it.id_ciudad = " + DropDownListCiudadesBus.SelectedValue;
            EntityDataSourceHoteles.Where = _where;
        }

        GridViewHoteles.PageIndex = 0;

    }
    protected void GridViewHoteles_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            LabelMensajeGrid.Text = BD.EsborrarHotel(e.Exception);
            e.ExceptionHandled = true;
        }
        else
        {
            LabelMensajeGrid.Text = "";
        }
    }
    protected void GridViewHoteles_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int telefono;

        TextBox txt = (TextBox) GridViewHoteles.Rows[e.RowIndex].Cells[5].FindControl("TextBox3");
        
        if (!int.TryParse(txt.Text, out telefono))
        {
            LabelMensajeGrid.Text = "El teléfono ha de ser numérico";
            txt.Focus();
            e.Cancel = true;
        }
        else
        {
            LabelMensajeGrid.Text = "";
        }
       
    }
}