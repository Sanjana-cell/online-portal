<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AssignCOurseToInstractor.aspx.cs" Inherits="AssignCOurseToInstractor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<div>
<table>
<tr>
<td> Course Name :</td>
    
<td><asp:DropDownList ID="ddlCourseName" runat="server" AutoPostBack="True" Width="89px"
        DataSourceID="SqlDataSource1" DataTextField="CourseName" 
        DataValueField="CourseName">
    </asp:DropDownList> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
        SelectCommand="SELECT [CourseName] FROM [AddCourse] WHERE ([CourseAvilable] = @CourseAvilable)">
        <SelectParameters>
            <asp:Parameter DefaultValue="Yes" Name="CourseAvilable" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td></tr>
<tr>
<td> Instractor Name :</td>
<td><asp:DropDownList ID="ddlInstractor" runat="server" AutoPostBack="True" Width="89px"
        DataSourceID="SqlDataSource2" DataTextField="uname" DataValueField="uname">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
        SelectCommand="SELECT [uname] FROM [OnlineStudyBooklogin] WHERE (([delrec] = @delrec) AND ([Etype] = @Etype) AND ([instAvailable] =@instAvailable))">
        <SelectParameters>
            <asp:Parameter DefaultValue="N" Name="delrec" Type="String" />
            <asp:Parameter DefaultValue="I" Name="Etype" Type="String" />
            <asp:Parameter DefaultValue="Yes" Name="instAvailable" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</td></tr>
    
  <tr>
  <td></td>
  <td> <asp:Button ID="txtAssigninst" runat="server" Text="Assign" 
          onclick="txtAssigninst_Click" Width="89px" /></td></tr>
</table></div>

<div>
<tabel>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
        DataKeyNames="CourseName" DataSourceID="SqlDataSource3">
    <Columns>
        <asp:BoundField DataField="CourseName" HeaderText="CourseName" 
            SortExpression="CourseName" />
        <asp:BoundField DataField="InstractorName" HeaderText="InstractorName" 
            SortExpression="InstractorName" />
        <asp:BoundField DataField="CourseAvilable" HeaderText="CourseAvilable" 
            SortExpression="CourseAvilable" />
        <asp:BoundField DataField="FeeOfCourse" HeaderText="FeeOfCourse" 
            SortExpression="FeeOfCourse" />
    </Columns>
    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#FFF1D4" />
    <SortedAscendingHeaderStyle BackColor="#B95C30" />
    <SortedDescendingCellStyle BackColor="#F1E5CE" />
    <SortedDescendingHeaderStyle BackColor="#93451F" />
</asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
        SelectCommand="SELECT  CourseName, InstractorName, CourseAvilable, FeeOfCourse FROM AddCourse WHERE (delrec = @delrec)" 
        UpdateCommand="UPDATE AddCourse SET CourseAvilable = 'Yes', InstractorName = NULL WHERE (CourseID = @CourseID) AND (delrec = @delrec)">
        <SelectParameters>
            <asp:Parameter DefaultValue="N" Name="delrec" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CourseID" />
            <asp:Parameter Name="delrec" />
        </UpdateParameters>
    </asp:SqlDataSource>

</tabel></div>
    


</asp:Content>

