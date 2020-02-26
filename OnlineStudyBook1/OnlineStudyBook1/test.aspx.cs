using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Data.Sql;
using System.Configuration;
public partial class test : System.Web.UI.Page
{
    String LogginName;
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    int loginID;
    
    protected void Page_Load(object sender, EventArgs e)
    {
               
            LogginName = (string)Session["UNAME"];
            
            //dataBinding();
        
    }
    void GetLoginID()
    {
        try
        {
            string str = "select eid from [OnlineStudyBook].[dbo].[OnlineStudyBooklogin] where uname='" + LogginName + "'";
            SqlCommand cmd = new SqlCommand(str, dbpath);
            SqlDataReader reader;
            dbpath.Open();
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                loginID = reader.GetInt32(0);
            }
            reader.Close();
            dbpath.Close();
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message);
        }
    }
   
    void dataBinding()
    {
        GetLoginID();
        String DBConnection = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
        string str = "select CourseName from AssignedCourseForStudents where Stuid='" + loginID + "'";

        using (SqlConnection con = new SqlConnection(DBConnection))
        {
            SqlCommand cmd1 = new SqlCommand(str, con);
            con.Open();
            ddlStudentAssignedCourses.DataSource = cmd1.ExecuteReader();
            ddlStudentAssignedCourses.DataTextField = "CourseName";
            ddlStudentAssignedCourses.DataValueField = "CourseName";
            ddlStudentAssignedCourses.DataBind();
            con.Close();
        }
    }

    void loadDataToGrid()
    {
        dataBinding();
        String constring = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
        using (SqlConnection sqlcon = new SqlConnection(constring))
        {
            sqlcon.Open();
            String SqlQuery = "select distinct(session), AuthorName,VideoLink FROM VideoUploadWRTCourse V ,AssignedCourseForStudents A where A.Assigned='Yes' and A.CourseName=v.CourseName and a.Stuid='" + loginID + "' and v.[CourseName]='" + ddlStudentAssignedCourses.SelectedValue + "'";
            SqlDataAdapter sqldata = new SqlDataAdapter(SqlQuery, sqlcon);
            DataTable dtbl = new DataTable();
            sqldata.Fill(dtbl);
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }
    }



    protected void ddlStudentAssignedCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        loadDataToGrid();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        dataBinding();
    }
}