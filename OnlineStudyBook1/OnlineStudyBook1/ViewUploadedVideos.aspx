<%@ Page Title="" Language="C#" MasterPageFile="~/Instractor.master" AutoEventWireup="true" CodeFile="ViewUploadedVideos.aspx.cs" Inherits="ViewUploadedVideos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


<div>
<table> <tr>
<td> Course name :</td>
<td> 
    <asp:Label ID="Label1" runat="server" BackColor="#CCCCCC" BorderColor="#996633"
        BorderStyle="Outset" ForeColor="Black" Height="21px" Width="122px" 
        style="text-align: center"></asp:Label>
    </td>
    <td> Author</td>
    <td> <asp:Label ID="Label2" runat="server" BackColor="#CCCCCC" BorderColor="#996633"
        BorderStyle="Outset" ForeColor="Black" Height="21px" Width="122px" 
        style="text-align: center"></asp:Label></td>
</tr></table></div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3">
    <Columns>
    <asp:BoundField DataField="Session" HeaderText="Session" />
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

