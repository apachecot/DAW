using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            //BD.Refrescar("hoteles");
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

        ButtonNou_ModalPopupExtender.Show();
    }
}