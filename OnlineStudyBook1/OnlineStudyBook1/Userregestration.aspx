<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true" CodeFile="Userregestration.aspx.cs" Inherits="Userregestration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <h1>New User Registration</h1> 
    <div>
<table>
<tr> <td> 
    <asp:Label ID="disp" runat="server" Text="" ></asp:Label></td></tr>

 <tr><td></td> <td> 
          <asp:RadioButtonList ID="rldlogin" runat="server" RepeatDirection="Horizontal" 
              AutoPostBack="True">
              <asp:ListItem Value="U" Selected="True">Student</asp:ListItem>
              <asp:ListItem Value="I">Instractor</asp:ListItem>
          </asp:RadioButtonList>
      </td></tr>
     
<tr>
    <td> Enter EmailID*</td>
    <td> 
        <asp:TextBox ID="Fldemail" runat="server"></asp:TextBox>
    </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
        ControlToValidate="Fldemail" Display="Dynamic" runat="server" ErrorMessage="EmailID Required"
        ValidationGroup="submit"></asp:RequiredFieldValidator>
     </td>
     <td>  
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
         ControlToValidate="Fldemail" ErrorMessage="Enter valid Email-Id(ABC@gmail.com)" 
         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
     </td>
</tr>
    <tr>
    <td> User Name*</td>
    <td><asp:TextBox ID="fldUsername" runat="server"></asp:TextBox> </td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
     ControlToValidate="fldUsername" Display="Dynamic" runat="server" ErrorMessage="username Required"
      ValidationGroup="submit"></asp:RequiredFieldValidator>
    </tr>
    <tr>
    <td>password*</td>
    <td> <asp:TextBox ID="fldpassword" runat="server" TextMode="Password"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3"
     ControlToValidate="fldpassword" Display="Dynamic" runat="server" ErrorMessage="password Required" 
     ValidationGroup="submit"></asp:RequiredFieldValidator></tr>
    <tr>
    <td> Conform password*</td>
    <td> <asp:TextBox ID="conformpassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="fldpassword" ControlToValidate="conformpassword" 
        ErrorMessage="Password did not match" ValidationGroup="submit"></asp:CompareValidator></td>
    </tr>
    <tr><td></td><td> 
        <asp:Button ID="fldsubmit" runat="server" Text="Submit"  ValidationGroup="submit"
            onclick="fldsubmit_Click" />
                <asp:Button ID="fldcancle" runat="server" Text="Cancel" 
                    onclick="fldcancle_Click"  ValidationGroup="cancel"/></td></tr>
    
    </table></div>
</asp:Content>

