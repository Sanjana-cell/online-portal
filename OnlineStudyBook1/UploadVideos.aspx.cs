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


public partial class UploadVideos : System.Web.UI.Page
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
    protected void btnSumbit_Click(object sender, EventArgs e)
    {
        bind();
        String constring = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
        SqlConnection sqlcon = new SqlConnection(constring);
        FileUpload1.SaveAs(Server.MapPath("~/video/") + Path.GetFileName(FileUpload1.FileName));
        String link = "video/" + Path.GetFileName(FileUpload1.FileName);
        link = "<Video width=400 Controls><Source src=" + link + " type=video/mp4></video>";
        String query = "Insert into VideoUploadWRTCourse(VideoID,CourseName,AuthorName,VideoLink,Session,Created,delrec) values('" + gSId + "','" + DropDownList1.Text + "','" + txtAuthor.Text + "','" + link + "','" + txtSessionNo .Text+ "',getdate(),'N')";
        SqlCommand cmd = new SqlCommand(query, sqlcon);
        sqlcon.Open(); ;
        cmd.ExecuteNonQuery();
        sqlcon.Close();
        cleanfield();
        Label1.Visible = true;
        Label1.Text = "Video Data Has Been Uploaded and Saved Successfully";

        

    }

    void bind()
    {
        try
        {
            string str = "select count(*) from VideoUploadWRTCourse";
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
        txtAuthor.Text = "";
        txtSessionNo.Text = "";
        
        
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
    protected void btncalcel_Click(object sender, EventArgs e)
    {

    }
   
}