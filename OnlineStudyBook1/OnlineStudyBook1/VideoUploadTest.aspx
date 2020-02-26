<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VideoUploadTest.aspx.cs" Inherits="VideoUploadTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 37%;
            height: 62px;
        }
        .style2
        {
            width: 123px;
        }
        .style3
        {
            width: 230px;
        }
        .style4
        {
            width: 113px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table bgcolor="#CCCCCC" class="style1">
            <tr>
                <td bgcolor="#FFFFCC" class="style2">
                    Video name</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Author name</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
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
                <td class="style4">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" />
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    <asp:HyperLink ID="HyperLink1" runat="server">View All Uploaded Videos</asp:HyperLink>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="VideoID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="VideoID" HeaderText="VideoID" ReadOnly="True" 
                SortExpression="VideoID" />
            <asp:BoundField DataField="Author" HeaderText="Author" 
                SortExpression="Author" />
            <asp:BoundField DataField="VideoName" HeaderText="VideoName" 
                SortExpression="VideoName" />
            <asp:TemplateField HeaderText="VideoLink" SortExpression="VideoLink">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("VideoLink") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("VideoLink") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
        SelectCommand="SELECT * FROM [UploadedVideos]"></asp:SqlDataSource>
    </form>
</body>
</html>
