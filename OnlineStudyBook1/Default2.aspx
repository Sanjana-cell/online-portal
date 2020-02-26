<%@ Page Title="" Language="VB" MasterPageFile="~/Login.master" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="262px" 
        style="margin-left: 249px" Width="324px">
        <Columns>
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
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
        SelectCommand="SELECT [AuthorName], [VideoLink] FROM [VideoUploadWRTCourse] WHERE ([delrec] = @delrec)">
        <SelectParameters>
            <asp:Parameter DefaultValue="N" Name="delrec" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

