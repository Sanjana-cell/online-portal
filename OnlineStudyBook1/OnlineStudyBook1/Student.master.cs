using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["NAME"] = "RAM";


        if (Session["UNAME"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        dispname.Text = (string)Session["UNAME"];
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Session["UNAME"] = "";
        Session["PWD"] = "";
        Session["UID"] = "";
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Login.aspx");

    }

}
