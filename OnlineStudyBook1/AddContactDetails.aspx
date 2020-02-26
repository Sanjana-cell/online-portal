<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddContactDetails.aspx.cs" Inherits="AddContactDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <h1>Add Contact Details</h1> 

<div>
<table>
<tr> <td>
    <asp:Label ID="disp" runat="server" Text=""></asp:Label> </td></tr>
<tr>
<td>Location Name</td>
<td> 
    <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
     Display="Dynamic" runat="server" ErrorMessage="Location Name required" ControlToValidate="txtLocation"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>

      <tr>
<td>Contact Number</td>
<td> 
    <asp:TextBox ID="txtCnum" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
     Display="Dynamic" runat="server" ErrorMessage="Mobile Number required" ControlToValidate="txtCnum"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>

<tr>
<td>Email ID</td>
<td> 
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3"
     Display="Dynamic" runat="server" ErrorMessage="Email ID required" ControlToValidate="txtEmail"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>
       <tr> 
       <tr>
<td>Land Line Number</td>
<td> 
    <asp:TextBox ID="txtLand" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4"
     Display="Dynamic" runat="server" ErrorMessage="Land Line Number required" ControlToValidate="txtLand"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>
       <tr> 
        <td></td><td><asp:Button ID="fldsubmit" runat="server" Text="Submit"  ValidationGroup="submit" onclick="fldsubmit_Click" />
        <asp:Button ID="fldcancle" runat="server" Text="Cancel"  onclick="fldcancle_Click" />

        </td></tr>

      </table>
      </div>




</asp:Content>

