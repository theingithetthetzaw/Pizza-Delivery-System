<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminUpdatePizza.aspx.cs" Inherits="Pizza_Delivery_System.AdminUpdateDeletePizza" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

        <div class="row">

            <div class="col-md-offset-4 col-md-4">

              <div class="panel panel-primary">
               
                <div class="panel-heading">Update Pizza</div>
                
                <div class="panel-body">

                    <label>Pizza Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtPizzaName" ForeColor="Red"></asp:RequiredFieldValidator></label>
                    <asp:TextBox ID="txtPizzaName" runat="server" class="w3-input" style="border-radius:0px;"></asp:TextBox>

                  
                    <br>
                    <label>Pizza Description<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtPizzaDescription" ForeColor="Red"></asp:RequiredFieldValidator></label>
                    <asp:TextBox ID="txtPizzaDescription" runat="server" class="w3-input" style="border-radius:0px;" MaxLength="100" TextMode="MultiLine" Rows="3"></asp:TextBox>

                   <br>
                    <label>Category<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="rbtnCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br><br><asp:RadioButtonList ID="rbtnCategory" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Veg</asp:ListItem>
                        <asp:ListItem>Non-Veg</asp:ListItem>
                    </asp:RadioButtonList></label>
                     <!-- <asp:DropDownList class="w3-input" ID="DropDownListCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryMasterId"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PizzaDBConnectionString %>" SelectCommand="SELECT [CategoryMasterId], [CategoryName] FROM [CategoryMaster]"></asp:SqlDataSource>-->
                    <br><br>
                    <label>PricPrice<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtPizzaPrice" ForeColor="Red"></asp:RequiredFieldValidator></label>
                    <asp:TextBox ID="txtPizzaPrice" runat="server" class="w3-input" style="border-radius:0px;" TextMode="Number"></asp:TextBox>

                    <br>
                    <label>Pizza Image</label><asp:FileUpload ID="PizzaImage" runat="server" />

                      <br>
                    <label>Pizza Discount:</label><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtDiscount" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtDiscount" runat="server" class="w3-input" style="border-radius:0px;" MaxLength="100" TextMode="Number" Rows="1"></asp:TextBox>


                      <br>
                    <label>Tax<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtTax" ForeColor="Red"></asp:RequiredFieldValidator></label>
                    <asp:TextBox ID="txtTax" runat="server" class="w3-input" style="border-radius:0px;" MaxLength="100" TextMode="Number" Rows="1"></asp:TextBox>


                    <br>
                    <label>Status :<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="rbtnStatus" ForeColor="Red"></asp:RequiredFieldValidator>
                     <br><br><asp:RadioButtonList ID="rbtnStatus" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Deactive</asp:ListItem>
                    </asp:RadioButtonList></label>
                   
                    <br>
                    <asp:Button ID="UpdatePizza" runat="server" Text="Update" class="btn btn-success" style="width:100%;" OnClick="UpdatePizza_Click" />
                
                </div>
             </div>
        </div>
    </div>
</div>


</asp:Content>
