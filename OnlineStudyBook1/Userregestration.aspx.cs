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
public partial class Userregestration : System.Web.UI.Page
{
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    SqlConnection dbpath1 = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    SqlConnection dbpath2 = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);

    int gSId;
    
     
    protected void Page_Load(object sender, EventArgs e)
    {
        bind();
        ShowSuccessFailureMessage();
    }
    private void ShowSuccessFailureMessage()
    {
        if (Request["a"] != null)
        {
            if (Request["a"] == "success")
            {
                disp.CssClass = string.Empty;
                disp.Text = "Record Inserted Successfully"; //message you want to display
            }
        }


    }

    protected void fldsubmit_Click(object sender, EventArgs e)
    {
       
        try
        {

            bind();
            string str = "INSERT INTO OnlineStudyBooklogin(Eid,Etype,email,uname,password,Delrec)  VALUES(" + gSId + ",'" + rldlogin.Text + "','" + Fldemail.Text + "','" + fldUsername.Text + "','" + fldpassword.Text + "','N');";
            SqlCommand cmd = new SqlCommand(str, dbpath1);
            dbpath1.Open();
            cmd.ExecuteNonQuery();
            dbpath1.Close();
            cleanfield();
            bind();
            Response.Redirect("~/Userregestration.aspx?a=success");
            
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message);
        }

    }
    void bind()
    {
        try
        {
            string str = "select count(*) from OnlineStudyBooklogin";
            SqlCommand cmd = new SqlCommand(str, dbpath2);
            SqlDataReader reader;
            dbpath2.Open();
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                gSId = reader.GetInt32(0);
                gSId = gSId + 1;
               

            }
            reader.Close();
            dbpath2.Close();
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message);
        }
    }
    void cleanfield()
    {
        Fldemail.Text = "";
        fldUsername.Text = "";
        fldpassword.Text = "";
        conformpassword.Text = "";
       }
    protected void fldcancle_Click(object sender, EventArgs e)
    {
        Response.Redirect("userregestration.aspx");

    }
}