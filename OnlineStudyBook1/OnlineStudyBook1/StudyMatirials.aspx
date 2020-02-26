<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="StudyMatirials.aspx.cs" Inherits="StudyMatirials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div>
<table> <tr>
<td> Course Name</td>
    <td><asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="CourseName" 
            DataValueField="CourseName" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" Height="20px" 
            style="text-align: center" Width="150px">
            
    </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
            SelectCommand="SELECT distinct([CourseName]) FROM [AssignedCourseForStudents] WHERE ([delrec] = @delrec)">
            <SelectParameters>
                <asp:Parameter DefaultValue="N" Name="delrec" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </td></tr>
    </table>

   
    <table> 
   <tr>
   <td width="600">
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" Visible="False"
           AutoGenerateColumns="False" PageIndex="5" CellPadding="4" 
           BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
           Width="565px" >

     <Columns>
    <asp:BoundField DataField="DocumentID" HeaderText="DocumentID" />
    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" />
    <asp:HyperLinkField DataNavigateUrlFields="DocumentLink" 
                HeaderText="StudyDocument" Text="View And Download" />
    </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
</asp:GridView>
       
   </td></tr>
    </table>


    <table>
        <tr>
    <td><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellPadding="3" Visible="False" CellSpacing="1" GridLines="None">
    <Columns>
    <asp:BoundField DataField="Session" HeaderText="Session" />
    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" />
     <asp:TemplateField HeaderText="VideoLink" SortExpression="VideoLink">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("VideoLink") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("VideoLink") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>

    </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle ForeColor="Black" BackColor="#DEDFDE" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    </td></tr>
    </table>
    </div>
</asp:Content>

