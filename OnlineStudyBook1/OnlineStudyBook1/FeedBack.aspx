<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="FeedBack.aspx.cs" Inherits="FeedBack" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</asp:ToolkitScriptManager>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <h1>FEED-BACK FORM</h1> 
<div>
<table>

<tr> <td>
    <asp:Label ID="disp" runat="server" Text=""></asp:Label> </td></tr>
<tr> <td> <asp:Label ID="lblName" runat="server" Text="Name *" Visible="true"></asp:Label></td>
    <td>  <asp:TextBox ID="txtName" runat="server" Visible="true"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
     ControlToValidate="txtName" Display="Dynamic" runat="server" ErrorMessage="Name is Required"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>
    
<tr> <td> <asp:Label ID="lblMovie" runat="server" Text="Movie *" Visible="true"></asp:Label></td>
    <td>  <asp:TextBox ID="txtMovie" runat="server" Visible="true"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
     ControlToValidate="txtName" Display="Dynamic" runat="server" ErrorMessage=" Movie Name is Required"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>
    <tr> 
        
    <td> Email ID*</td>
    <td> <asp:TextBox ID="fldemailid" runat="server" Enabled="true"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
     ControlToValidate="fldemailid" Display="Dynamic" runat="server" ErrorMessage="Email ID Required"
      ValidationGroup="submit"></asp:RequiredFieldValidator></td>
   <td>  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
         ControlToValidate="fldemailid" ErrorMessage="Enter valid Email-Id" 
         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
     </td>
     </tr>
    <tr> <td> Mobile Num*</td>
    <td> <asp:TextBox ID="fldmobile" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
     ControlToValidate="fldmobile" Display="Dynamic" runat="server" ErrorMessage="Mobile Num Required"
      ValidationGroup="submit"></asp:RequiredFieldValidator></td></tr>
    
    <tr> <td> <asp:Label ID="Label3" runat="server" Text="Comments" Visible="true"></asp:Label></td>
    <td>  <asp:TextBox ID="txtComments" runat="server" Visible="true" Height="96px" 
            Width="367px"></asp:TextBox></td></tr>
    <tr> <td> </td></tr>
  </tabel>
  <tabel>
   <tr> 
   <td> <asp:Label ID="Label2" runat="server" Text="Ratting" Visible="true"></asp:Label></td>
   <td>  
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
            RepeatDirection="Horizontal" 
            onselectedindexchanged="fldpaytype_SelectedIndexChanged">
            <asp:ListItem Value="1" Selected="True">Very-Good</asp:ListItem>
            <asp:ListItem Value="2">Good</asp:ListItem>
            <asp:ListItem Value="3">Average</asp:ListItem>
            <asp:ListItem Value="4">Not Satisfied</asp:ListItem>
            <asp:ListItem Value="5">Worst</asp:ListItem>
        </asp:RadioButtonList>
    </td></tr>
  
    <tr> <td> </td></tr>
    <tr><td></td> <td> 
        <asp:Button ID="submit" runat="server" Text="submit" onclick="fldsubmit_Click" ValidationGroup="submit" /></td></tr>
    </table></div>

    <div>
    
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="SqlDataSource2" GridLines="Vertical">
    <AlternatingRowStyle BackColor="#DCDCDC" />
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="Coursename" HeaderText="Coursename" 
            SortExpression="Coursename" />
        <asp:BoundField DataField="EmailID" HeaderText="EmailID" 
            SortExpression="EmailID" />
        <asp:BoundField DataField="Comments" HeaderText="Comments" 
            SortExpression="Comments" />
        <asp:BoundField DataField="MobileNumber" HeaderText="MobileNumber" 
            SortExpression="MobileNumber" />
        <asp:BoundField DataField="Ratting" HeaderText="Ratting" 
            SortExpression="Ratting" />
    </Columns>
    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#0000A9" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#000065" />
</asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
            SelectCommand="SELECT [Name], [Coursename], [EmailID], [Comments], [MobileNumber], [Ratting] FROM [CustomerFeedBack] WHERE ([delrec] = @delrec)">
            <SelectParameters>
                <asp:Parameter DefaultValue="N" Name="delrec" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
            
            SelectCommand="SELECT [Name], [Moviename], [Comments] FROM [CustomerFeedBack] WHERE ([delrec] = @delrec)">
            <SelectParameters>
                <asp:Parameter DefaultValue="N" Name="delrec" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>


