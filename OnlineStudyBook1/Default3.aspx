<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default3.aspx.vb" Inherits="Default3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="pid" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="pid" HeaderText="pid" ReadOnly="True" 
                SortExpression="pid" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:OnlineStudyBookConnectionString %>" 
        DeleteCommand="DELETE FROM [paymentdetails] WHERE [pid] = @original_pid AND (([CourseName] = @original_CourseName) OR ([CourseName] IS NULL AND @original_CourseName IS NULL)) AND (([Studentname] = @original_Studentname) OR ([Studentname] IS NULL AND @original_Studentname IS NULL)) AND (([Approval] = @original_Approval) OR ([Approval] IS NULL AND @original_Approval IS NULL)) AND (([amount] = @original_amount) OR ([amount] IS NULL AND @original_amount IS NULL))" 
        InsertCommand="INSERT INTO [paymentdetails] ([pid], [CourseName], [Studentname], [Approval], [amount]) VALUES (@pid, @CourseName, @Studentname, @Approval, @amount)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [pid], [CourseName], [Studentname], [Approval], [amount] FROM [paymentdetails] WHERE (([delrec] = @delrec) AND ([Approval] = @Approval))" 
        UpdateCommand="UPDATE paymentdetails SET Approval ='Y' WHERE pid =@original_pid">
        <DeleteParameters>
            <asp:Parameter Name="original_pid" Type="Int32" />
            <asp:Parameter Name="original_CourseName" Type="String" />
            <asp:Parameter Name="original_Studentname" Type="String" />
            <asp:Parameter Name="original_Approval" Type="String" />
            <asp:Parameter Name="original_amount" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pid" Type="Int32" />
            <asp:Parameter Name="CourseName" Type="String" />
            <asp:Parameter Name="Studentname" Type="String" />
            <asp:Parameter Name="Approval" Type="String" />
            <asp:Parameter Name="amount" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="N" Name="delrec" Type="String" />
            <asp:Parameter DefaultValue="N" Name="Approval" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CourseName" Type="String" />
            <asp:Parameter Name="Studentname" Type="String" />
            <asp:Parameter Name="Approval" Type="String" />
            <asp:Parameter Name="amount" Type="Decimal" />
            <asp:Parameter Name="original_pid" Type="Int32" />
            <asp:Parameter Name="original_CourseName" Type="String" />
            <asp:Parameter Name="original_Studentname" Type="String" />
            <asp:Parameter Name="original_Approval" Type="String" />
            <asp:Parameter Name="original_amount" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
