<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="PaymentApprovalForStudent.aspx.cs" Inherits="PaymentApprovalForStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<div>
<table>
<tr>
<td><asp:GridView ID="PaymentApprovalGrid" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource2" 
        DataKeyNames="pid">
    <Columns>
        <asp:CommandField ShowEditButton="True" />
        <asp:BoundField DataField="pid" HeaderText="pid" 
            SortExpression="pid" ReadOnly="True" />
        <asp:BoundField DataField="CourseName" HeaderText="CourseName" 
            SortExpression="CourseName" />
        <asp:BoundField DataField="Studentname" HeaderText="Studentname" 
            SortExpression="Studentname" />
        <asp:BoundField DataField="Approval" HeaderText="Approval" 
            SortExpression="Approval" />
        <asp:BoundField DataField="amount" HeaderText="amount" 
            SortExpression="amount" />
    </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
        SelectCommand="SELECT [pid], [CourseName], [Studentname], [Approval], [amount] FROM [paymentdetails] WHERE (([delrec] = @delrec) AND ([Approval] = @Approval))" 
        UpdateCommand="UPDATE paymentdetails SET Approval ='Y' WHERE pid =@pid">
        <SelectParameters>
            <asp:Parameter DefaultValue="N" Name="delrec" />
            <asp:Parameter DefaultValue="N" Name="Approval" />
        </SelectParameters>
        <UpdateParameters>
        </UpdateParameters>
    </asp:SqlDataSource>
</td></tr></table></div>
    

</asp:Content>

