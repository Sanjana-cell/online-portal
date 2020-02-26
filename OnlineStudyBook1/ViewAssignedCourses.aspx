<%@ Page Title="" Language="C#" MasterPageFile="~/Instractor.master" AutoEventWireup="true" CodeFile="ViewAssignedCourses.aspx.cs" Inherits="ViewAssignedCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<div>   <table>
<tr>
<td><asp:GridView ID="gridViewAssigned" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="CourseID" 
        DataSourceID="SqlDataSource1">
    <Columns>
        
        <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" 
            SortExpression="CourseID" />
            <asp:BoundField DataField="CourseName" HeaderText="CourseName" 
            SortExpression="CourseName" />
        <asp:BoundField DataField="InstractorName" HeaderText="InstractorName" 
            SortExpression="InstractorName" />
    </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
        SelectCommand="SELECT [CourseID], [CourseName],  [InstractorName] FROM [AddCourse] WHERE ([delrec] = @delrec)">
        <SelectParameters>
            <asp:Parameter DefaultValue="N" Name="delrec" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td></tr></table></div>
</asp:Content>

