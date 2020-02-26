<%@ Page Title="" Language="C#" MasterPageFile="~/Instractor.master" AutoEventWireup="true" CodeFile="UploadVideos.aspx.cs" Inherits="UploadVideos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div>
    
    <table>
   
    <tr>
    <td>  <asp:Label ID="disp" runat="server" Text="" ></asp:Label></td></tr></td></tr></table>
        <table bgcolor="#CCCCCC" class="style1">
            <tr>
                <td bgcolor="#FFFFCC" class="style2">
                    Course Name</td>
               <td> <asp:DropDownList ID="DropDownList1" runat="server" Height="17px" 
                       Width="126px">
                    </asp:DropDownList></td>
                </td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Author Name</td>
                <td class="style3">
                    <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
                </td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Session No</td>
                <td class="style3">
                    <asp:TextBox ID="txtSessionNo" runat="server"></asp:TextBox>
                </td>
                <td class="style4">
                    &nbsp;</td>
            </tr>




            <tr>
                <td class="style2">
                    Upload Video</td>
                <td class="style3">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                
            </tr>
            <tr> <td></td>
            <td class="style4">
                    <asp:Button ID="btnSumbit" runat="server" Text="Submit" 
                        onclick="btnSumbit_Click" />
                    <asp:Button ID="btncalcel" runat="server" Text="Cancel" 
                        onclick="btncalcel_Click"/>
                   
                </td></tr>
                <td></td>
                <tr><asp:Label ID="Label1" runat="server" Text="Label" Visible="false">
                 </asp:Label>
                </tr>
        </table>
    
    </div>


</asp:Content>

