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

public partial class OnlineTestForStudent : System.Web.UI.Page
{
    SqlConnection dbpath1 = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    int gSId;
    
    String LogginName;
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    int loginID;
    String courseSessionName;

    protected void Page_Load(object sender, EventArgs e)
    {

        LogginName = (string)Session["UNAME"];
        GetLoginID();
        if (Request.QueryString["timeout"] != null)
        {
            lbstatus.Text = "You test time expired, please try again!";
        }

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


    void bind()
    {
        try
        {
            string str = "select count(*) FROM tblQuestions V ,AssignedCourseForStudents A where A.Assigned='Yes' and A.CourseName=v.CourseName and a.Stuid='" + loginID + "' and v.[CourseName]='" + DropDownList1.SelectedValue + "'";
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        courseSessionName = DropDownList1.SelectedValue;

        Session["tempSelection"] = courseSessionName;
        Session["LoginStudentID"] = loginID;

        Response.Redirect("BeginJavaTest.aspx");

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        bind();
        if (gSId > 0)
        {
                Button1.Visible = true;
        }
        else if (gSId == 0)
        {
            Response.Write("<script >alert('You have not Purchased the Selected Course To take test ');</script>");
            Button1.Visible = false;

        }
        
    }
}