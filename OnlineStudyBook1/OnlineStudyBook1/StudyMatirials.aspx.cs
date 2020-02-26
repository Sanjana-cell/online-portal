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
public partial class StudyMatirials : System.Web.UI.Page
{
    String LogginName;
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    SqlConnection dbpath1 = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    SqlConnection dbpath2 = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    int gSId;
    int gVId;
    int loginID;

    protected void Page_Load(object sender, EventArgs e)
    {
        LogginName = (string)Session["UNAME"];
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

    void loadDataToGrid()
    {
        GetLoginID();
        String constring = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
        using (SqlConnection sqlcon = new SqlConnection(constring))
        {
            sqlcon.Open();
            String SqlQuery = "select distinct(session), AuthorName,VideoLink FROM VideoUploadWRTCourse V ,AssignedCourseForStudents A where A.Assigned='Yes' and A.CourseName=v.CourseName and a.Stuid='" + loginID + "' and v.[CourseName]='" + DropDownList1.SelectedValue + "'";
            SqlDataAdapter sqldata = new SqlDataAdapter(SqlQuery, sqlcon);
            DataTable dtbl = new DataTable();
            sqldata.Fill(dtbl);
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
            GridView1.Visible = true;
            GridView2.Visible = true;
            loadDataToGrid();
            dataBindToGrid();
    }

    public void dataBindToGrid()
    {
        String constring = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
        using (SqlConnection sqlcon = new SqlConnection(constring))
        {
            sqlcon.Open();
            String SqlQuery = "select DocumentID,AuthorName,DocumentLink from [OnlineStudyBook].[dbo].[DocumentUploadWRTCourse] V ,AssignedCourseForStudents A where A.Assigned='Yes' and A.CourseName=v.CourseName and a.Stuid='" + loginID + "' and v.[CourseName]='" + DropDownList1.SelectedValue + "'";

            SqlDataAdapter sqldata = new SqlDataAdapter(SqlQuery, sqlcon);
            DataTable dtbl = new DataTable();
            sqldata.Fill(dtbl);
            GridView2.DataSource = dtbl;
            GridView2.DataBind();
        }
    }

    void GridControlForCoursesWRTDocument()
    {
        try
        {
            string str = " select count(*) from [OnlineStudyBook].[dbo].[DocumentUploadWRTCourse] V ,AssignedCourseForStudents A where A.Assigned='Yes' and A.CourseName=v.CourseName and a.Stuid='" + loginID + "' and v.[CourseName]='" + DropDownList1.SelectedValue + "'";
            SqlCommand cmd = new SqlCommand(str, dbpath1);
            SqlDataReader reader;
            dbpath1.Open();
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                gSId = reader.GetInt32(0);
            }
            reader.Close();
            dbpath1.Close();
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message);
        }
    }

    void GridControlForCoursesWRTVideos()
    {
        try
        {
            string str = "select count(*) FROM VideoUploadWRTCourse V ,AssignedCourseForStudents A where A.Assigned='Yes' and A.CourseName=v.CourseName and a.Stuid='" + loginID + "' and v.[CourseName]='" + DropDownList1.SelectedValue + "'";
            SqlCommand cmd = new SqlCommand(str, dbpath2);
            SqlDataReader reader;
            dbpath2.Open();
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                gVId = reader.GetInt32(0);
            }
            reader.Close();
            dbpath2.Close();
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message);
        }
    }



}