<%@ Page Title="" Language="C#" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeFile="ChangePassword1.aspx.cs" Inherits="ChangePassword1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <h1>Change Password</h1> 
<table>

<tr> <td><asp:Label ID="lblmsg" runat="server" Text=""></asp:Label> </td></tr>
    

<tr><td>Old Password</td><td>
<asp:TextBox ID="fldoldpwd" runat="server" 
        TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="fldoldpwd" ErrorMessage="Old password required" 
        ValidationGroup="submit"></asp:RequiredFieldValidator>
    </td></tr>

<tr><td>New Password</td><td>
<asp:TextBox ID="fldnewpwd" runat="server" 
        TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="fldnewpwd" ErrorMessage="Password should not be empty " 
        ValidationGroup="submit"></asp:RequiredFieldValidator>
    </td></tr>

<tr><td>Confirm Password</td><td>
<asp:TextBox ID="fldcnpwd" runat="server" 
        TextMode="Password"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="fldnewpwd" ControlToValidate="fldcnpwd" 
        ErrorMessage="Password did not match" ValidationGroup="submit"></asp:CompareValidator>
    </td></tr>

<tr><td></td><td>
    <asp:Button ID="cpsubmit" runat="server" Text="Submit" 
        onclick="cpsubmit_Click" ValidationGroup="submit" /></td></tr>

</table>
</asp:Content>

