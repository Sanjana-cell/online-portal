<%@ Page Title="" Language="C#" MasterPageFile="~/Instractor.master" AutoEventWireup="true" CodeFile="UploadPDF.aspx.cs" Inherits="UploadPDF" %>

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
                    Upload PDF Document</td>
                <td class="style3">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td> <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label></td>
                
            </tr>
            <tr> <td></td>
            <td class="style4">
                    <asp:Button ID="btnSumbit" runat="server" Text="Submit" 
                        onclick="btnSumbit_Click" />
                    <asp:Button ID="btncalcel" runat="server" Text="Cancel" 
                        onclick="btncalcel_Click"/>
                   
                </td></tr>
                <td>
                    
            </td>
                <tr><asp:Label ID="Label1" runat="server" Text="Label" Visible="false">
                 </asp:Label>
                </tr>
        </table>
    
    </div>

    <div>
    <table> 
   <tr>
   <td>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
           AutoGenerateColumns="False" PageIndex="5" CellPadding="4" ForeColor="#333333" 
           GridLines="None">

        <AlternatingRowStyle BackColor="White" />

     <Columns>
    <asp:BoundField DataField="DocumentID" HeaderText="DocumentID" />
    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" />
    <asp:HyperLinkField DataNavigateUrlFields="DocumentLink" 
                HeaderText="StudyDocument" Text="View And Download" />
    </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
       
   </td></tr>
    </table></div>
</asp:Content>



