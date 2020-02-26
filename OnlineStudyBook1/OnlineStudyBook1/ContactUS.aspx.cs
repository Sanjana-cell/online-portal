using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.IO;

public partial class ContactUS : System.Web.UI.Page
{

    protected void BtnBTLF_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}