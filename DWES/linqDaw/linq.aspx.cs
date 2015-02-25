using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class linq : System.Web.UI.Page
{
    aulacepEntities contexto = new aulacepEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        List<cicles> ciclos =
            (from c in contexto.cicles
             orderby c.codi ascending
            select c).ToList();

        DropDownListCicles.DataTextField = "codi";
        DropDownListCicles.DataValueField = "id";

        DropDownListCicles.DataSource = ciclos;
        DropDownListCicles.DataBind();



    }
    protected void GridView2_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        

        if (e.Exception != null)
        {
            SqlException sqlEx = (SqlException) e.Exception.InnerException;
            LabelMensaje.Text = BDErrores.Mensaje(sqlEx);
            e.ExceptionHandled = true;
        }
    }
}