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

public partial class AssignCourceToStudent : System.Web.UI.Page
{
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    SqlConnection dbpath2 = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    int gSId;
    String LoginName;
    int loginID;
    String InstractorName;
    String str1;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        bind();
        ShowSuccessFailureMessage();
         LoginName=(string)Session["Uname"];
    }
    protected void ddlCourseSelect_SelectedIndexChanged(object sender, EventArgs e)
    {
        dataBinding();
    }
    void dataBinding()
    {

        String DBConnection = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
        string str = "select Studentname from paymentdetails where Approval='Y' and delrec='N' and CourseName ='" + ddlCourseSelect.Text + "'";

        using (SqlConnection con = new SqlConnection(DBConnection))
        {
            SqlCommand cmd1 = new SqlCommand(str, con);
            con.Open();
            ddlstudentSelection.DataSource = cmd1.ExecuteReader();
            ddlstudentSelection.DataTextField = "Studentname";
            ddlstudentSelection.DataValueField = "Studentname";
            ddlstudentSelection.DataBind();
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
    void selectStudentID()
    {
        try
        {
            string str2 = "select Eid from OnlineStudyBooklogin where uname='" + ddlstudentSelection.Text + "' and Etype='U'";
            SqlCommand cmd2 = new SqlCommand(str2, dbpath);
            //SqlDataReader reader2;
            //reader2 = cmd2.ExecuteReader();
            dbpath.Open();
            SqlDataReader dr = cmd2.ExecuteReader();
            int found = 0;
            if (dr.Read())
            {
                loginID = dr.GetInt32(0);

            }
            dbpath.Close();
        }
        catch (Exception e)
        {
            Response.Write(e);
        }
    }
    void Instractorname()
    {
        try
        {
            string str2 = "select InstractorName from AddCourse where CourseName='" + ddlCourseSelect.Text + "' and CourseAvilable='No'";
            SqlCommand cmd2 = new SqlCommand(str2, dbpath);
            dbpath.Open();
            SqlDataReader dr = cmd2.ExecuteReader();
            int found = 0;
            if (dr.Read())
            {
                InstractorName = (dr["InstractorName"].ToString());

            }
            dbpath.Close();
        }
        catch (Exception e)
        {
            Response.Write(e);
        }
    } 
    void bind()
    {
        try
        {
            string str = "select count(*) from AssignedCourseForStudents ";
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

    void UpdateAssignesStatus()
    {

        try
        {
            str1 = "Update paymentdetails set assigned='Yes' where [CourseName]='" + ddlCourseSelect.Text + "' and Studentname='" + ddlstudentSelection.Text+ "'";
            SqlCommand cmd = new SqlCommand(str1, dbpath2);
            dbpath2.Open();
            cmd.ExecuteNonQuery();
            dbpath2.Close();
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {

            bind();
            selectStudentID();
            Instractorname();
            string str = "INSERT INTO AssignedCourseForStudents(StuCouAssignID,CourseName,InstractorName,StudentName,Stuid,Assigned,delrec)  VALUES(" + gSId + ",'" + ddlCourseSelect.Text + "','" + InstractorName + "','" + ddlstudentSelection.Text + "','" + loginID + "','Yes','N');";
            SqlCommand cmd = new SqlCommand(str, dbpath);
            dbpath.Open();
            cmd.ExecuteNonQuery();
            dbpath.Close();
            bind();
            UpdateAssignesStatus();
            Response.Redirect("~/AssignCourceToStudent.aspx?a=success");

        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message);
        }
    }
}