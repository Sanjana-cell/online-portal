<%@ Page Title="" Language="C#" MasterPageFile="~/Instractor.master" AutoEventWireup="true" CodeFile="ViewUploadedVideos.aspx.cs" Inherits="ViewUploadedVideos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">



    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="CourseName" HeaderText="CourseName" 
            SortExpression="CourseName" />
        <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" 
            SortExpression="AuthorName" />
        <asp:TemplateField HeaderText="VideoLink" SortExpression="VideoLink">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("VideoLink") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("VideoLink") %>'></asp:Literal>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="delrec" HeaderText="delrec" 
            SortExpression="delrec" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
    SelectCommand="SELECT [CourseName], [AuthorName], [VideoLink], [delrec] FROM [VideoUploadWRTCourse] WHERE ([delrec] = @delrec)" 
    UpdateCommand="UPDATE VideoUploadWRTCourse SET delrec = 'Y' WHERE (VideoID = @VideoID)">
    <SelectParameters>
        <asp:Parameter DefaultValue="N" Name="delrec" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="VideoID" />
    </UpdateParameters>
</asp:SqlDataSource>



</asp:Content>

