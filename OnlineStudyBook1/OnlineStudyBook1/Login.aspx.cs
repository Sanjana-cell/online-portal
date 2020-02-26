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

public partial class Loginpage : System.Web.UI.Page
{
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    String str;
    int Gid=0;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    } 

    protected void login_Click(object sender, EventArgs e)
    {
       
        string u;
        string p;        
        int found = 0;
        try
        {

            if (rldlogin.Text == "A")
            {

                str = "select * from [OnlineStudyBook].[dbo].[OnlineStudyBooklogin] where Delrec='N' and Etype='A' and uname = '" + fldusername.Text + "'" + "and password= '" + fldpassword.Text + "'";
            }
            else if (rldlogin.Text == "U")
            {
                str = "select * from [OnlineStudyBook].[dbo].[OnlineStudyBooklogin] where Delrec='N' and Etype='U' and uname = '" + fldusername.Text + "'" + "and password= '" + fldpassword.Text + "'";
            }
            else if (rldlogin.Text == "I")
            {
                str = "select * from [OnlineStudyBook].[dbo].[OnlineStudyBooklogin] where Delrec='N' and Etype='I' and uname = '" + fldusername.Text + "'" + "and password= '" + fldpassword.Text + "'";
            }
            SqlCommand cmd = new SqlCommand(str, dbpath);
            SqlDataReader reader;
            dbpath.Open();
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                found = 1;
                u = reader.GetString(1);
                p = reader.GetString(2);
                Gid = reader.GetInt32(0);
                reader.Close();
                dbpath.Close();
                Session["UNAME"] = fldusername.Text.Trim();
                Session["PWD"] = fldpassword.Text.Trim();
                Session["lid"] = Gid;
                string str2 = "UPDATE OnlineStudyBooklogin SET lastUpdate=CURRENT_TIMESTAMP where Delrec='N' and Eid=" + Gid + "";
                SqlCommand cmd1 = new SqlCommand(str2, dbpath);
                dbpath.Open();
                cmd1.ExecuteNonQuery();
                if (rldlogin.Text == "U")
                {
                    Response.Redirect("FeedBack.aspx");

                    fldusername.Text = "";
                    fldpassword.Text = "";    
    
                }
                if (rldlogin.Text == "A")
                {
                    Response.Redirect("AddCourse.aspx");

                    fldusername.Text = "";
                    fldpassword.Text = "";

                }
                if (rldlogin.Text == "I")
                {
                    Response.Redirect("UploadVideos.aspx");

                    fldusername.Text = "";
                    fldpassword.Text = "";

                }
                else
                {
                    Response.Redirect("Userregestration.aspx");

                    fldusername.Text = "";
                    fldpassword.Text = "";    
    
                }
            }
               
                 
            else
            {
                lblmes.Text="Invalid user name or Password";
            } 
          }
        catch(SqlException ex) 
        {
            Response.Write(ex.Message);
        }
       
    }

    protected void reset_Click(object sender, EventArgs e)
    {
        fldusername.Text="";
        fldpassword.Text = "";    
    }
}