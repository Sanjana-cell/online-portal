using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public partial class BeginJavaTest : System.Web.UI.Page
{
    SqlConnection dbpath = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString);
    int gSId;
    String constring1 = ConfigurationManager.ConnectionStrings["OnlineStudyBookConnectionString"].ConnectionString;
    DataTable dt = new DataTable();
    String CoursenameSelectedFortest;
    int loginID;

    protected void Page_Load(object sender, EventArgs e)
    {
        CoursenameSelectedFortest = (string)Session["tempSelection"];
        loginID = (int)(Session["LoginStudentID"]);
        bind();
        if (gSId > 0)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        else if (gSId == 0)
        {
            Response.Write("<script >alert('You have not Purchased the Selected Course To take test ');</script>");
        
        }
    
    }
    public void BindGrid()
    {
        String sqlQuery = "select  QuestionId,Question,Option1,Option2,Option3,Option4,QuestionAnswer,v.courseName FROM tblQuestions V ,AssignedCourseForStudents A where A.Assigned='Yes' and A.CourseName=v.CourseName and a.Stuid='" + loginID + "' and v.[CourseName]='" + CoursenameSelectedFortest + "'";
        SqlDataAdapter adp = new SqlDataAdapter(sqlQuery, constring1);
        adp.Fill(dt);
        grdquestions.DataSource = dt;
        grdquestions.DataBind();
    }
    protected void grdquestions_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            RadioButtonList rdlstOptions = (RadioButtonList)e.Row.FindControl("rdlstOptions");
            HiddenField hdnquestionId = (HiddenField)e.Row.FindControl("hdnquestionId");
            if (rdlstOptions != null && hdnquestionId != null)
            {
                DataRow[] result = dt.Select("questionid=" + (Convert.ToInt32(hdnquestionId.Value)));
                DataView view = new DataView();
                view.Table = dt;
                view.RowFilter = "questionid=" + (Convert.ToInt32(hdnquestionId.Value));
                if (view.Table.Rows.Count > 0)
                {
                    DataTable dt1 = new DataTable();
                    dt1 = view.ToTable();
                }
            }
        }
    }

    void bind()
    {
        try
        {
            string str = "select count(*) FROM tblQuestions V ,AssignedCourseForStudents A where A.Assigned='Yes' and A.CourseName=v.CourseName and a.Stuid='" + loginID + "' and v.[CourseName]='" + CoursenameSelectedFortest + "'";
            SqlCommand cmd = new SqlCommand(str, dbpath);
            SqlDataReader reader;
            dbpath.Open();
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                gSId = reader.GetInt32(0);
            }
            reader.Close();
            dbpath.Close();
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message);
        }
    }




    protected void BackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("OnlineTestForStudent.aspx");
    }
}

