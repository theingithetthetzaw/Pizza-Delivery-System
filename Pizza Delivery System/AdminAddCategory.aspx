<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminAddCategory.aspx.cs" Inherits="Pizza_Delivery_System.AdminAddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container-fluid">

        <div class="row">

            <div class="col-md-offset-4 col-md-4">

              <div class="panel panel-default">
               
                <div class="panel-heading">Add Pizza Category</div>
                
                <div class="panel-body">

                    <label>Category Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtPizzaCategoryName" ForeColor="Red"></asp:RequiredFieldValidator></label>
                    <asp:TextBox ID="txtPizzaCategoryName" runat="server" class="w3-input" style="border-radius:0px;"></asp:TextBox>

                    <label>Type<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="rbtnType" ForeColor="Red"></asp:RequiredFieldValidator></label><br>
                    <asp:RadioButtonList ID="rbtnType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="Veg">Veg</asp:ListItem>
                        <asp:ListItem Value="Non-Veg">Non-Veg</asp:ListItem>
                    </asp:RadioButtonList>
                    <br>
                    <asp:Button ID="AddPizzaCategory" runat="server" Text="Add" class="btn btn-warning" style="width:100%;" OnClick="AddPizza_Click" />
                
                </div>
             </div>
        </div>
    </div>
</div>

</asp:Content>
