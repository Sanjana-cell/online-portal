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

public partial class AddContactDetails : System.Web.UI.Page
{
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);

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
            string str = "INSERT INTO ContactUs(LocationID,LocationName,ContactNum,EmailID,LandLineNum,delrec)  VALUES(" + gSId + ",'" + txtLocation.Text + "','" + txtCnum.Text + "','" + txtEmail.Text + "','" + txtLand.Text + "','N');";
            SqlCommand cmd = new SqlCommand(str, dbpath);
            dbpath.Open();
            cmd.ExecuteNonQuery();
            dbpath.Close();
            cleanfield();
            bind();
            Response.Redirect("~/AddContactDetails.aspx?a=success");

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
            string str = "select count(*) from ContactUs ";
            SqlCommand cmd = new SqlCommand(str, dbpath);
            SqlDataReader reader;
            dbpath.Open();
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                gSId = reader.GetInt32(0);
                gSId = gSId + 1;

            }
            reader.Close();
            dbpath.Close();
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message);
        }
    }
    void cleanfield()
    {
        txtLocation.Text = " ";
        txtCnum.Text = " ";
        txtLand.Text = " ";
        txtEmail.Text = " ";
    }
    protected void fldcancle_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddContactDetails.aspx");

    }
}