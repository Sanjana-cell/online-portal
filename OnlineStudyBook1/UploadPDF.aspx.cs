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

public partial class UploadPDF : System.Web.UI.Page
{
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    String LogginName;
    int gSId;
    static String Documentlink;

    static Int32 DocumentID;



    protected void Page_Load(object sender, EventArgs e)
    {
        ShowSuccessFailureMessage();
        bind();
        LogginName = (string)Session["UNAME"];
        dataBinding();
        dataBindToGrid();
    }
    private void ShowSuccessFailureMessage()
    {
        if (Request["a"] != null)
        {
            if (Request["a"] == "success")
            {
                disp.CssClass = string.Empty;
                disp.Text = "Document Uploaded Successfully"; //message you want to display
            }
        }


    }
    protected void btnSumbit_Click(object sender, EventArgs e)
    {
        
        if (uploadDocument() == true)
        {
            String query = "insert into DocumentUploadWRTCourse(DocumentID,CourseName,AuthorName,DocumentLink,Created,delrec,LastModified) values(" + DocumentID + ",'" + DropDownList1.Text + "','" + txtAuthor.Text + "','" + Documentlink + "',getdate(),'N','" + LogginName + "')";
            String mycon = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            cleanfield();
            Label1.Visible = true;
            Label1.Text = "Document Had Been Uploaded and Saved Successfully";
           
        }
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
        cleanfield();
        Response.Redirect("UploadPDF.aspx");
    }

    private Boolean uploadDocument()
    {
        Boolean DocumentSaved = false;
        if (FileUpload1.HasFile == true)
        {

            String contenttype = FileUpload1.PostedFile.ContentType;

            if (contenttype == "application/pdf")
            {
                int filesize;
                filesize = FileUpload1.PostedFile.ContentLength;
                 
                getDocumentID();
                FileUpload1.SaveAs(Server.MapPath("~/UploadedPDF/") + DocumentID + ".pdf");

                Documentlink = "UploadedPDF/" + DocumentID + ".pdf";
                DocumentSaved = true;
                Label2.Text = "";
            }
            else
            {
                Label2.Text = "Upload Document in PDF Format Only";
            }

        }
        else
        {
            Label2.Text = "Kindly Upload Document Before Apply in PDF Format";
        }


        return DocumentSaved;
    }
    public void getDocumentID()
    {
        String mycon = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
       
        SqlConnection scon = new SqlConnection(mycon);
        String myquery = "select DocumentID from DocumentUploadWRTCourse";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = scon;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        scon.Close();
        if (ds.Tables[0].Rows.Count < 1)
        {
            DocumentID = 10001;

        }
        else
        {
            String mycon1 = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
            SqlConnection scon1 = new SqlConnection(mycon1);
            String myquery1 = "select max(DocumentID) from DocumentUploadWRTCourse";
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = myquery1;
            cmd1.Connection = scon1;
            SqlDataAdapter da1 = new SqlDataAdapter();
            da1.SelectCommand = cmd1;
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            DocumentID = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());
            DocumentID = DocumentID + 1;
            scon1.Close();
        }

    }


    public void dataBindToGrid()
    {
        String constring = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
        using (SqlConnection sqlcon = new SqlConnection(constring))
        {
            sqlcon.Open();
            String SqlQuery = "select DocumentID,AuthorName,DocumentLink from [OnlineStudyBook].[dbo].[DocumentUploadWRTCourse] VUC ,[OnlineStudyBook].[dbo].[AddCourse] Ad where Ad.CourseAvilable='No' and VUC.CourseName=Ad.CourseName and Ad.InstractorName='" + LogginName + "'";

            SqlDataAdapter sqldata = new SqlDataAdapter(SqlQuery, sqlcon);
            DataTable dtbl = new DataTable();
            sqldata.Fill(dtbl);
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }
    }

}