<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AssignCourceToStudent.aspx.cs" Inherits="AssignCourceToStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<table><tr> <td>
    <asp:Label ID="disp" runat="server" Text=""></asp:Label> </td></tr></table>


<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="pid" 
        DataSourceID="SqlDataSource1">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" />
        <asp:BoundField DataField="pid" HeaderText="pid" ReadOnly="True" 
            SortExpression="pid" />
        <asp:BoundField DataField="CourseName" HeaderText="CourseName" 
            SortExpression="CourseName"   />
        <asp:BoundField DataField="Studentname" HeaderText="Studentname" 
            SortExpression="Studentname" />
        <asp:BoundField DataField="Approval" HeaderText="Approval" 
            SortExpression="Approval" />
            <asp:BoundField DataField="assigned" HeaderText="Assigned" 
            SortExpression="assigned" />
    </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
        DeleteCommand="UPDATE paymentdetails SET delrec = 'Y' WHERE pid = @pid" 
        SelectCommand="SELECT [pid] , [CourseName], [Studentname], [Approval],[Assigned] FROM [paymentdetails] WHERE (([delrec] = @delrec) AND ([Approval] = @Approval) AND ([assigned] = @assigned))">
        <DeleteParameters>
        </DeleteParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="N" Name="delrec" />
            <asp:Parameter DefaultValue="Y" Name="Approval" />
            <asp:Parameter DefaultValue="No" Name="assigned" />
        </SelectParameters>
        <UpdateParameters>
        </UpdateParameters>
    </asp:SqlDataSource>
    <div>
    <table>
    <tr>
    <td>  Assign Courses to student  
        
    </td>
    </tr>
    <tr>
    <td>Course list</td>
    <td> <asp:DropDownList ID="ddlCourseSelect" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource2" DataTextField="CourseName" 
            DataValueField="CourseName" 
            onselectedindexchanged="ddlCourseSelect_SelectedIndexChanged" 
            Height="22px" Width="142px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
            SelectCommand="SELECT [CourseName] FROM [AddCourse] WHERE ([delrec] = @delrec)">
            <SelectParameters>
                <asp:Parameter DefaultValue="N" Name="delrec" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </td></tr>
        <tr>    
        <td>Student Name</td>
        <td><asp:DropDownList ID="ddlstudentSelection" runat="server" Height="22px" 
                Width="142px">
            </asp:DropDownList></td></tr>
        <tr><td></td> <td><asp:Button ID="btnSave" runat="server" Text="Submit" 
                onclick="btnSave_Click" Width="142px" /> </td></tr>
        </table></div>
    
</asp:Content>


