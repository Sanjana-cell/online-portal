<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Loginpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

   
   

  <!--  <div class="logindiv1"  align="center" style="background-color: transparent; background-image: url(Images/img5.jpg); height:480px;width:350px; border:"2""> -->
<div class="logindiv" style="border:"2""></div>
<table class="login_table" cellspacing="20">
    <p>
     <h2>Please enter your username and password.</h2>
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Register</asp:HyperLink> if you don't have an account.
    </p>
      <tr><td class="style1"></td><td class="style1"><h2> Enter login Details </h2></td></tr>
      <tr><td></td> <td> 
          <asp:RadioButtonList ID="rldlogin" runat="server" RepeatDirection="Horizontal" 
              AutoPostBack="True">
              <asp:ListItem Value="A" Selected="True">Admin</asp:ListItem>
              <asp:ListItem Value="I">Instractor</asp:ListItem>
              <asp:ListItem Value="U">User</asp:ListItem>
          </asp:RadioButtonList>
      </td></tr>
      

<tr><td>UserName:</td>
<td><asp:TextBox ID="fldusername" runat="server" ></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
        ControlToValidate="fldusername" runat="server" ErrorMessage="UserName Required" 
        ValidationGroup="login"></asp:RequiredFieldValidator> </td></tr>


 <tr><td>Password:</td>
<td><asp:TextBox ID="fldpassword" runat="server" TextMode="Password" ></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
        ControlToValidate="fldpassword" runat="server" ErrorMessage="Password Required" 
        ValidationGroup="login"></asp:RequiredFieldValidator> 
     </td></tr>

<tr><td></td> <td> 
    <asp:Button ID="login" runat="server" Text="Login" 
        onclick="login_Click" ValidationGroup="login" /> 
    
    <asp:Button ID="reset" runat="server" Text="Reset" onclick="reset_Click" ValidationGroup="reset" 
       /> 
    </td> </tr> 
    <p>
    <tr> <td> <asp:Label ID="lblmes" runat="server" Text="">
        </asp:Label><br/>
        </td></tr>
       
        
    </p>   
    
      <tr><td></td><td> New User?<asp:HyperLink ID="HyperLink1" NavigateUrl="Userregestration.aspx" runat="server" Text="(Register Now)" /></td></tr>
       </table>
</div>
</asp:Content>

