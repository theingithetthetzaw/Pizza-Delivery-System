<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminViewCategory.aspx.cs" Inherits="Pizza_Delivery_System.AdminViewCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <center>
    <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="10" CellSpacing="5" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="CategoryMasterId">
        <Columns>
            <asp:BoundField DataField="CategoryMasterId" HeaderText="CategoryMasterId" InsertVisible="False" ReadOnly="True" SortExpression="CategoryMasterId" Visible="False" />
            <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName" />
            <asp:BoundField DataField="VegNonVeg" HeaderText="Veg-NonVeg" SortExpression="VegNonVeg" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
    </center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PizzaDBConnectionString %>" DeleteCommand="DELETE FROM [CategoryMaster] WHERE [CategoryMasterId] = @CategoryMasterId" InsertCommand="INSERT INTO [CategoryMaster] ([CategoryName], [VegNonVeg]) VALUES (@CategoryName, @VegNonVeg)" SelectCommand="SELECT * FROM [CategoryMaster]" UpdateCommand="UPDATE [CategoryMaster] SET [CategoryName] = @CategoryName, [VegNonVeg] = @VegNonVeg WHERE [CategoryMasterId] = @CategoryMasterId">
        <DeleteParameters>
            <asp:Parameter Name="CategoryMasterId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
            <asp:Parameter Name="VegNonVeg" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
            <asp:Parameter Name="VegNonVeg" Type="String" />
            <asp:Parameter Name="CategoryMasterId" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
