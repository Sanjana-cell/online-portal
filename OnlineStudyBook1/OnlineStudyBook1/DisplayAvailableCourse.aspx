<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="DisplayAvailableCourse.aspx.cs" Inherits="DisplayAvailableCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


<div>
<table>
<tr>
<td> List Of the available Courses</td></tr>
<tr>
<td> <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="CourseName" HeaderText="CourseName" 
            SortExpression="CourseName" />
        <asp:BoundField DataField="FeeOfCourse" HeaderText="FeeOfCourse" 
            SortExpression="FeeOfCourse" />
        <asp:BoundField DataField="InstractorName" HeaderText="InstractorName" 
            SortExpression="InstractorName" />
        <asp:BoundField DataField="FromDate" HeaderText="FromDate" 
            SortExpression="FromDate" />
        <asp:BoundField DataField="ToDate" HeaderText="ToDate" 
            SortExpression="ToDate" />
    </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
        SelectCommand="SELECT [CourseName], [FeeOfCourse], [InstractorName], [FromDate], [ToDate] FROM [AddCourse] WHERE ([delrec] = @delrec)">
        <SelectParameters>
            <asp:Parameter DefaultValue="N" Name="delrec" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td></tr>
    
    <tr> <td> Select The Course :
    <asp:DropDownList ID="ddlSelectCourse" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource2" DataTextField="CourseName" 
            DataValueField="CourseName" Height="23px" Width="165px">
    </asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
            SelectCommand="SELECT [CourseName] FROM [AddCourse] WHERE ([delrec] = @delrec)">
            <SelectParameters>
                <asp:Parameter DefaultValue="N" Name="delrec" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="Pay Course Amount" 
            onclick="Button1_Click" />
        </td></tr>
        </table></div>
</asp:Content>

