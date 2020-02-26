<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="PaymentMode.aspx.cs" Inherits="PaymentMode" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</asp:ToolkitScriptManager>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <h1>Payment</h1> 
<div>
<table>
<tr> <td>
    <asp:Label ID="disp" runat="server" Text=""></asp:Label> </td></tr>
<tr>
 <td> <asp:Label ID="Cos" runat="server" Text="Confirm the Course Name"></asp:Label></td>
  <td><asp:DropDownList ID="txtCourseName" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource2" DataTextField="CourseName" 
            DataValueField="CourseName" Height="23px" Width="165px">
    </asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
            SelectCommand="SELECT [CourseName] FROM [AddCourse] WHERE ([delrec] = @delrec)">
            <SelectParameters>
                <asp:Parameter DefaultValue="N" Name="delrec" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource></td></tr>

 <tr>
 <td> <asp:Label ID="lblAmountpertocket" runat="server" Text="Amount"></asp:Label></td>
 <td>  <asp:TextBox ID="txtAMount" runat="server" ></asp:TextBox></td></tr>

    <tr><td>Payment Date(dd/mm/yyyy) </td>
     <td><asp:TextBox ID="fldpayment" runat="server" ></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender2" runat="server"  
            TargetControlID="fldpayment" Enabled="true" Format="yyyy/MM/dd">
    </asp:CalendarExtender></td>

   <tr> <td> pay Type</td>
    <td>  
        <asp:RadioButtonList ID="fldpaytype" runat="server" AutoPostBack="True" 
            RepeatDirection="Horizontal" 
            onselectedindexchanged="fldpaytype_SelectedIndexChanged">
            <asp:ListItem Value="C" Selected="True">Cash</asp:ListItem>
            <asp:ListItem Value="CC">CreditCard</asp:ListItem>
            <asp:ListItem Value="CD">DebitCard</asp:ListItem>
        </asp:RadioButtonList>
    </td></tr>
    <tr> 
     <td><asp:Label ID="Lblbankname" runat="server" Text="Bank Name" Visible="false"></asp:Label></td>
    <td>  <asp:TextBox ID="fldbank" runat="server" Visible="false"></asp:TextBox></td></tr>

    <tr> <td> <asp:Label ID="lblBAN" runat="server" Text="Bank Account Number" Visible="false"></asp:Label></td>
    <td>  <asp:TextBox ID="fldbankacc" runat="server" Visible="false"></asp:TextBox></td></tr>
     <tr> <td> 
        <asp:Label ID="fldddcc" runat="server" Text="Card Number"  Visible="false"></asp:Label>
     
       </td><td> <asp:TextBox ID="fldCard" runat="server"  Visible="false"></asp:TextBox></td></tr>

       <tr> <td><asp:Label ID="lblcvv" runat="server" Text="CVV"  Visible="false"></asp:Label></td>
    <td>  <asp:TextBox ID="fldCVV" runat="server" Visible="false"></asp:TextBox></td>
    <tr><td></td> <td> 
        <asp:Button ID="submit" runat="server" Text="submit" onclick="fldsubmit_Click" ValidationGroup="submit" /></td></tr>
    </table></div>
</asp:Content>

