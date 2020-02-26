<%@ Page Title="" Language="C#" MasterPageFile="~/Instractor.master" AutoEventWireup="true" CodeFile="PrepareTest.aspx.cs" Inherits="PrepareTest" %>

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
                <td bgcolor="#FFFFCC" class="style2">
                    Course Name</td>
               <td> <asp:DropDownList ID="DropDownList1" runat="server" Height="17px" 
                       Width="223px">
                    </asp:DropDownList></td>
                </td>
                <td class="style4">
                    &nbsp;</td>
            </tr>

<tr>
<td>Question ?</td>
<td> 
    <asp:TextBox ID="txtQuestion" runat="server" Height="61px" Width="223px"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
     Display="Dynamic" runat="server" ErrorMessage="Question required" ControlToValidate="txtQuestion"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>

    <tr>
<td>Option1</td>
<td> 
    <asp:TextBox ID="txtOption1" runat="server" Width="223px"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
     Display="Dynamic" runat="server" ErrorMessage="Option requerd" ControlToValidate="txtOption1"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>

<tr>
<td>Option2</td>
<td> 
    <asp:TextBox ID="txtOption2" runat="server" Width="223px"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3"
     Display="Dynamic" runat="server" ErrorMessage="Option requerd" ControlToValidate="txtOption2"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>

<tr>
<td>Option3</td>
<td> 
    <asp:TextBox ID="txtOption3" runat="server" Width="223px"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4"
     Display="Dynamic" runat="server" ErrorMessage="Option requerd" ControlToValidate="txtOption3"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>

<tr>
<td>Option4</td>
<td> 
    <asp:TextBox ID="txtOption4" runat="server" Width="223px"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5"
     Display="Dynamic" runat="server" ErrorMessage="Option requerd" ControlToValidate="txtOption4"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>

<tr>
<td>Answer for the question</td>
<td> 
    <asp:TextBox ID="txtAnswer" runat="server" Width="223px"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6"
     Display="Dynamic" runat="server" ErrorMessage="Answer Name required" ControlToValidate="txtAnswer"
      ValidationGroup="submit"></asp:RequiredFieldValidator> </td></tr>
   

    

      
     <tr> 
        <td></td><td><asp:Button ID="fldsubmit" runat="server" Text="Submit"  ValidationGroup="submit" onclick="fldsubmit_Click" />
        <asp:Button ID="fldcancle" runat="server" Text="Cancel"  onclick="fldcancle_Click" />

        </td></tr>
      </table>
      </div>


</asp:Content>

