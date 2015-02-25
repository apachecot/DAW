using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;

public partial class Alta : System.Web.UI.Page
{
    aulacepEntities contexto = new aulacepEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonAlta_Click(object sender, EventArgs e)
    {
        LabelMensaje.Text = BD.AltaCurso(int.Parse(TextBoxId.Text),TextBoxCodi.Text, TextBoxDescripcio.Text, 
                                            int.Parse(DropDownListCiclos.SelectedValue));  
    }
}