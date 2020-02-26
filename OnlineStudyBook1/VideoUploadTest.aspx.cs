using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class VideoUploadTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
    String constring = "Data Source=IN-L1057;Initial Catalog=OnlineStudyBook;Integrated Security=True";
    SqlConnection sqlcon = new SqlConnection(constring);
    FileUpload1.SaveAs(Server.MapPath("~/video/") + Path.GetFileName(FileUpload1.FileName));
    String link = "video/" + Path.GetFileName(FileUpload1.FileName);
    link = "<Video width=400 Controls><Source src=" + link + " type=video/mp4></video>";
    String query = "Insert into UploadedVideos(VideoID,Author,VideoName,VideoLink) values(3,'" + TextBox2.Text + "','" + TextBox1.Text + "','" + link + "')";
    SqlCommand cmd = new SqlCommand(query, sqlcon);
    sqlcon.Open(); ;
    cmd.ExecuteNonQuery();
    sqlcon.Close();
    Label1.Text = "Video Data Has Been Uploaded and Saved Successfully";
    TextBox1.Text = "";
    TextBox2.Text = "";
    GridView1.DataBind();
    }
}