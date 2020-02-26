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
public partial class ViewUploadedVideos : System.Web.UI.Page
{
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    String constring = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
    String constring1 = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
    String Loginuser;
    protected void Page_Load(object sender, EventArgs e)
    {
        Loginuser = (string)Session["Uname"];
        DisplayCourseAndAuthorName();

        using (SqlConnection sqlcon = new SqlConnection(constring))
        {
            sqlcon.Open();
            String SqlQuery = "select VideoLink,Session from [OnlineStudyBook].[dbo].[VideoUploadWRTCourse] VUC ,[OnlineStudyBook].[dbo].[AddCourse] Ad where Ad.CourseAvilable='No' and VUC.CourseName=Ad.CourseName and Ad.InstractorName='" + Loginuser + "'";

            SqlDataAdapter sqldata = new SqlDataAdapter(SqlQuery, sqlcon);
            DataTable dtbl = new DataTable();
            sqldata.Fill(dtbl);
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }

    }
   

    void DisplayCourseAndAuthorName()
    {
        using (SqlConnection sqlcon = new SqlConnection(constring1))
        {
             sqlcon.Open();
            String SeleyQuery = "select VUC.CourseName , VUC.AuthorName from [OnlineStudyBook].[dbo].[VideoUploadWRTCourse] VUC ,[OnlineStudyBook].[dbo].[AddCourse] Ad where Ad.CourseAvilable='No' and VUC.CourseName=Ad.CourseName and Ad.InstractorName='" + Loginuser + "'";
            SqlDataAdapter sqda = new SqlDataAdapter(SeleyQuery, sqlcon);
            DataTable Dt = new DataTable();
            sqda.Fill(Dt);
            Label1.Text = Dt.Rows[0][0].ToString();
            Label2.Text = Dt.Rows[0][1].ToString();
            sqlcon.Close();
        }
        
    }

}