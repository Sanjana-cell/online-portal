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


public partial class testViewOnlyAssignedCourses : System.Web.UI.Page
{
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    String LogginName;
        int gSId;
    
    

    protected void Page_Load(object sender, EventArgs e)
    {   bind();
        ShowSuccessFailureMessage();
        LogginName = (string)Session["UNAME"];
        dataBinding();  
         
    }

    void dataBinding()
    {

        String DBConnection = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
        string str = "select CourseName from [OnlineStudyBook].[dbo].[AddCourse] where InstractorName ='" + LogginName + "'";

        using (SqlConnection con = new SqlConnection(DBConnection))
        {
            SqlCommand cmd1 = new SqlCommand(str, con);
            con.Open();
            DropDownList1.DataSource = cmd1.ExecuteReader();
            DropDownList1.DataTextField = "CourseName";
            DropDownList1.DataValueField = "CourseName";
            DropDownList1.DataBind();
            con.Close();
        }
       
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


}