﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true" CodeFile="ContactUS.aspx.cs" Inherits="ContactUS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  
<table>
<tr>
<td> </td>
<td> <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
        DataKeyNames="LocationID" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="LocationID" HeaderText="LocationID" ReadOnly="True" 
            SortExpression="LocationID" />
        <asp:BoundField DataField="LocationName" HeaderText="LocationName" 
            SortExpression="LocationName" />
        <asp:BoundField DataField="ContactNum" HeaderText="ContactNum" 
            SortExpression="ContactNum" />
        <asp:BoundField DataField="EmailID" HeaderText="EmailID" 
            SortExpression="EmailID" />
        <asp:BoundField DataField="LandLineNum" HeaderText="LandLineNum" 
            SortExpression="LandLineNum" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
        SelectCommand="SELECT [LocationID], [LocationName], [ContactNum], [EmailID], [LandLineNum] FROM [ContactUs] WHERE ([delrec] = @delrec)">
        <SelectParameters>
            <asp:Parameter DefaultValue="N" Name="delrec" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td>
    
</tr>
<tr>
<td></td>
<td>
<asp:Button ID="BtnBTLF" runat="server" Text="Back To Login Form" 
        onclick="BtnBTLF_Click" />
</td></tr>
    
</table>
    
</asp:Content>

