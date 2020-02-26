<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="OnlineTestForStudent.aspx.cs" Inherits="OnlineTestForStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        #form1
        {
            width: 851px;
        }
        .style1
        {
            width: 612px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Online Test </title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js" type="text/javascript"></script>  
         
        <script>
            function StartTest(popUpPage) {
                window.open(popUpPage, 'null', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,fullscreen=yes');
            }  
        </script>
   
</head>
<body>
    <form id="form1">
   <div style=" text-align :center; width:100%">  
                
                        <table border="2" cellpadding="10" style="height: 272px; width: 910px;" >  
                            <tr>  
                                <td style="text-align:center;" class="style1">  
                                    <b>  
                                       <asp:Label ID="lbstatus" runat="server" 
                                       BackColor="Black" BorderColor="Red" Font-Bold="True" 
                                       Font-Size="16pt" 
                                        ForeColor="#0066FF">Online Test</asp:Label>  
                                      </b>  
                                </td>  
                            </tr>  
                            <tr>  
                                <td style="text-align:center;" class="style1">
                                <asp:Label ID="Label1" runat="server" Text="Course Name" BackColor="White" 
                                        BorderColor="#FF3300" BorderStyle="Solid" ForeColor="Black" Height="20px" 
                                        Width="100px" ></asp:Label> 
                             <!--   <asp:DropDownList ID="ddlStudentAssignedCourses" runat="server" 
                                 AutoPostBack="false" Height="25px" Width="120px">
                                  </asp:DropDownList></td> -->
                                

                                
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="CourseName" 
            DataValueField="CourseName" 
            style="text-align: center" Height="25px" Width="120px" 
                                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            
    </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
            SelectCommand="SELECT distinct([CourseName]) FROM [tblQuestions] WHERE ([delrec] = @delrec)">
            <SelectParameters>
                <asp:Parameter DefaultValue="N" Name="delrec" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </td></tr>



                                 
                            </tr>  
                            <tr>  
                              <!--  <td style="text-align: center;" class="style1">  
                                    <asp:Button ID="btnStartTest" Text="Start Test" runat="server" 
                                        OnClientClick="return StartTest('BeginJavaTest.aspx');"
                                         BorderColor="#FF6600" BorderWidth="4px" Height="43px" Width="142px" />  -->
                                </td>  

                                <td style="text-align: center;" class="style1">  
                                    <asp:Button ID="Button1" Text="Start Test" runat="server" 
                                         BorderColor="#FF6600" BorderWidth="4px" Height="43px" Width="142px" 
                                        onclick="Button1_Click"  Visible="false"/>  
                                </td>  


                            </tr>  
                        </table>  
                  
            </div>  
    </form>
</body>
</html>



</asp:Content>

