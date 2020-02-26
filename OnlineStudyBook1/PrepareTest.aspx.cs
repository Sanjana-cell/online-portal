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

public partial class PrepareTest : System.Web.UI.Page
{
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    String LogginName;
    int gSId;


    protected void Page_Load(object sender, EventArgs e)
    {
        ShowSuccessFailureMessage();
        bind();
        LogginName = (string)Session["UNAME"];
        dataBinding();
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
            string str = "select count(*) from tblQuestions";
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
        txtQuestion.Text = "";
        txtOption1.Text = "";
        txtOption2.Text = "";
        txtOption3.Text = "";
        txtOption4.Text = "";
        txtAnswer.Text = "";


    }
    void dataBinding()
    {

        String DBConnection = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
        string str = "select CourseName from AddCourse where InstractorName ='" + LogginName + "'";

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
    protected void fldsubmit_Click(object sender, EventArgs e)
    {
        try
        {

            bind();
            string str = "INSERT INTO tblQuestions(QuestionId,courseName,Question,Option1,Option2,Option3,Option4,QuestionAnswer,delrec)  VALUES(" + gSId + ",'" + DropDownList1.Text + "','" + txtQuestion.Text + "','" + txtOption1.Text + "','" + txtOption2.Text + "','" + txtOption3.Text + "','" + txtOption4.Text + "','" + txtAnswer.Text + "','N');";
            SqlCommand cmd = new SqlCommand(str, dbpath);
            dbpath.Open();
            cmd.ExecuteNonQuery();
            dbpath.Close();
            cleanfield();
            bind();
            Response.Write("<script >alert('Question Added Successfully ');</script>");
           // Response.Redirect("~/PrepareTest.aspx?a=success");

        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void fldcancle_Click(object sender, EventArgs e)
    {
        cleanfield();
    }
}