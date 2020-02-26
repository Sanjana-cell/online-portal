<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div>
<table> 
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />

<td><asp:Label ID="Label1" runat="server" Text="Course Name" ></asp:Label> </td>
<td> <asp:DropDownList ID="ddlStudentAssignedCourses"
     runat="server" 
        onselectedindexchanged="ddlStudentAssignedCourses_SelectedIndexChanged" 
        AutoPostBack="True">
</asp:DropDownList></td></tr></table></div>

 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" Visible="false">
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
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>

</asp:Content>


