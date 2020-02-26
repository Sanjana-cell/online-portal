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

public partial class PaymentMode : System.Web.UI.Page
{
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    int gSId;
    String loginName;
    int loginID;
    protected void Page_Load(object sender, EventArgs e)
    {
       loginName=(string) Session["Uname"];
      
        GetLoginID();
        bind();
        ShowSuccessFailureMessage();
    }





    void GetLoginID()
    {
        try
        {
            string str = "select eid from [OnlineStudyBook].[dbo].[OnlineStudyBooklogin] where uname='" + loginName + "'";
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

    protected void fldsubmit_Click(object sender, EventArgs e)
    {

        try
        {

            bind();
            string str = "INSERT INTO paymentdetails(pid,CourseName,LoginId,Studentname,paytype,BankName,bankaccno,amount,cardno,paydate,delrec,assigned)VALUES(" + gSId + ",'" + txtCourseName.Text + "','" + loginID + "','" + loginName + "','" + fldpaytype.Text + "','" + fldbank.Text + "','" + fldbankacc.Text + "','" + txtAMount.Text + "','" + fldCard.Text + "',getdate(),'N','No');";
            SqlCommand cmd = new SqlCommand(str, dbpath);
            dbpath.Open();
            cmd.ExecuteNonQuery();
            dbpath.Close();
            cleanfield();
            bind();
            Response.Redirect("~/DisplayAvailableCourse.aspx?a=success");
            

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
            string str = "select count(*) from paymentdetails ";
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
        fldbank.Text = " ";
        fldbankacc.Text = " ";
        fldddcc.Text = " ";
        fldbankacc.Text = " ";
    }
    protected void fldcancle_Click(object sender, EventArgs e)
    {
        Response.Redirect("DisplayAvailableCourse.aspx");

    }
    protected void fldpaytype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (fldpaytype.Text == "C")
        {
            Lblbankname.Visible = false;
            fldbank.Visible = false;
            lblBAN.Visible = false;
            fldbankacc.Visible = false;
            fldddcc.Visible = false;
            fldCard.Visible = false;
            lblcvv.Visible = false;
            fldCVV.Visible = false;
            

        }
        else
        {
            Lblbankname.Visible = true;
            fldbank.Visible = true;
            lblBAN.Visible = true;
            fldbankacc.Visible = true;
            fldddcc.Visible = true;
            fldCard.Visible = true;
            lblcvv.Visible = true;
            fldCVV.Visible = true;
            
            

        }
    }
    
}
