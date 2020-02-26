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

public partial class AssignCOurseToInstractor : System.Web.UI.Page
{
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    SqlConnection dbpath1 = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void txtAssigninst_Click(object sender, EventArgs e)
    {
        AssignInstractor();
        AssignCourse();

    }
    void AssignInstractor()
    {
        try
        {
            string str = "update OnlineStudyBooklogin set instAvailable='No' where Etype='I' and uname='" + ddlInstractor .Text+ "'";
            SqlCommand cmd = new SqlCommand(str, dbpath);
            SqlDataReader reader;
            dbpath.Open();
            reader = cmd.ExecuteReader();
            dbpath.Close();
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message);
        }
    }
    void AssignCourse()
    {
        try
        {
            string str = "update AddCourse  set CourseAvilable='No', InstractorName='" + ddlInstractor.Text + "' where CourseName='" + ddlCourseName .Text+ "'";
            SqlCommand cmd = new SqlCommand(str, dbpath1);
            dbpath1.Open();
            cmd.ExecuteNonQuery();
            dbpath1.Close();
            Response.Redirect("~/AssignCOurseToInstractor.aspx?a=success");

        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message);
        }
    }
}