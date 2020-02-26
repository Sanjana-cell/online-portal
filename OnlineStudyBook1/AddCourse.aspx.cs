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

public partial class AddCourse : System.Web.UI.Page
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
            string str = "INSERT INTO AddCourse(CourseID,CourseName,FeeOfCourse,FromDate,ToDate,delrec)  VALUES(" + gSId + ",'" + txtCourseName.Text + "','" + txtFee.Text + "','" + frmDate.Text + "','" + txtTo.Text+ "','N');";
            SqlCommand cmd = new SqlCommand(str, dbpath);
            dbpath.Open();
            cmd.ExecuteNonQuery();
            dbpath.Close();
            cleanfield();
            bind();
            Response.Redirect("~/AddCourse.aspx?a=success");

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
            string str = "select count(*) from AddCourse ";
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
        txtCourseName.Text = "";
       
    }
    protected void fldcancle_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddCourse.aspx");

    }
   
}