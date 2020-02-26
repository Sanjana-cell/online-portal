<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs" Inherits="AddCourse" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</asp:ToolkitScriptManager>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <h1>Add Course</h1> 

<div>
<table>
<tr> <td>
    <asp:Label ID="disp" runat="server" Text=""></asp:Label> </td></tr>
<tr>
<td>Course Name</td>
<td> 
    <asp:TextBox ID="txtCourseName" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
     Display="Dynamic" runat="server" ErrorMessage="Course Name required" ControlToValidate="txtCourseName"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>

       

        <tr>
    <td>Fee Of Course</td>
    <td> 
    <asp:TextBox ID="txtFee" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3"
     Display="Dynamic" runat="server" ErrorMessage="Fees is required" ControlToValidate="txtFee"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>

      <tr><td>Start Date(dd/mm/yyyy) </td>
     <td><asp:TextBox ID="frmDate" runat="server" ></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
            TargetControlID="frmDate" Enabled="true" Format="yyyy/MM/dd">
    </asp:CalendarExtender></td></tr>

    <tr>     <td>To Date(dd/mm/yyyy) </td>
     <td><asp:TextBox ID="txtTo" runat="server" ></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
            TargetControlID="txtTo" Enabled="true" Format="yyyy/MM/dd">
    </asp:CalendarExtender></td>
    </tr>
     <tr> 
        <td></td><td><asp:Button ID="fldsubmit" runat="server" Text="Submit"  ValidationGroup="submit" onclick="fldsubmit_Click" />
        <asp:Button ID="fldcancle" runat="server" Text="Cancel"  onclick="fldcancle_Click" />

        </td></tr>
      </table>
      </div>


</asp:Content>

