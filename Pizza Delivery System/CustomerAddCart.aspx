<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerAddCart.aspx.cs" Inherits="Pizza_Delivery_System.CustomerAddCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row" >
            
           <asp:Repeater ID="Pizza" runat="server" OnItemCommand="Pizza_ItemCommand">

            <HeaderTemplate>

                <table class="table table-hover text-center">

                  <tr>
                      
                      <th class="text-center">Pizza Name</th>
                      <th class="text-center">Price</th>
                      <th class="text-center">Image</th>
                       <th class="text-center">Quntity</th>
                      <th class="text-center">Add</th>
                      

                  </tr>


            </HeaderTemplate>

            <ItemTemplate>

                  <tr>
                      <asp:Label ID="PizzaImage" runat="server" Text=<%#Eval("PizzaImagePath") %> Visible="False"></asp:Label>
                      <asp:Label ID="Pid" runat="server" Text=<%#Eval("PizzaMasterId")%> Visible="False"></asp:Label>
                      <td><asp:Label ID="PizzaName" runat="server" Text=<%#Eval("PizzaName")%>></asp:Label></td>
                      <td><asp:Label ID="PizzaPrice" runat="server" Text=<%#Eval("Price")%>></asp:Label></td>
                      <td><img src="<%#Eval("PizzaImagePath") %>" alt="Avatar" style="width:200px;border-radius:10px;"></td>
                      <td><asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Quantity" ForeColor="Red" ControlToValidate="txtQuantity"></asp:RequiredFieldValidator></td>
                      <td><asp:Button ID="btnAddCart" runat="server" Text="Add Cart" class="w3-btn w3-green" OnClick="AddCart" /></td>
 
                  </tr>

            </ItemTemplate>

            <FooterTemplate> </FooterTemplate>

            </asp:Repeater>
         </div>


      </asp:Content>
