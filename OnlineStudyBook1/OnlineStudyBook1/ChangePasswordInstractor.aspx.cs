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

public partial class ChangePassword1 : System.Web.UI.Page
{
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["PWD"] == "" || Session["UNAME"] == "")
            Response.Redirect("Login.aspx");
           
        
    }
    
    protected void cpsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if ((string)Session["PWD"] == fldoldpwd.Text)
            {
                if (fldnewpwd.Text == fldcnpwd.Text)
                {

                    string str = "UPDATE OnlineStudyBooklogin SET lastupdate=CURRENT_TIMESTAMP ,password ='" + fldnewpwd.Text + "',uname='" + Session["UNAME"] + "' WHERE Eid ='" + Session["lid"] + "'";
                    SqlCommand cmd = new SqlCommand(str, dbpath);
                    dbpath.Open();
                    cmd.ExecuteNonQuery();
                    dbpath.Close();
                    Session["PWD"] = fldnewpwd.Text;
                    Response.Write("<script >alert('Updated successfully ');</script>");
                   // lblmsg.Text = "Updated successfully";

                }
            }
            else
            {
                lblmsg.Text = ("Enter the Correct Password");
            }

        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message);
        }
    }
}