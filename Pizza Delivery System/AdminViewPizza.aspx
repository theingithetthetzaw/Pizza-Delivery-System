<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminViewPizza.aspx.cs" Inherits="Pizza_Delivery_System.AdminViewPizza" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="w3-container">

        <div class="row">
            <div class="col-md-4"> 
             <asp:TextBox ID="txtSearchPizza" runat="server" CssClass="w3-input" placeholder="Search Pizza" OnTextChanged="txtSearchPizza_TextChanged" TextMode="Search"></asp:TextBox>
            </div>
        </div>
        <br><br>
        <div class="row" >
            <asp:Repeater ID="Pizza" runat="server" >

            <HeaderTemplate>

                <table class="table table-hover text-center">

                  <tr>
                      <th class="text-center">Id</th>
                      <th class="text-center">Pizza Name</th>
                      <th class="text-center">Description</th>
                      <th class="text-center">Category</th>
                      <th class="text-center">Price</th>
                      <th class="text-center">Image</th>
                      <th class="text-center">Discount</th>
                      <th class="text-center">Tax</th>
                      <th class="text-center">Status</th>
                      <th class="text-center">Update</th>
                      <th class="text-center">Delete</th>

                  </tr>


            </HeaderTemplate>

            <ItemTemplate>

                  <tr>
                      <td><%#Eval("PizzaMasterId")%></td>
                      <td><%#Eval("PizzaName")%></td>
                      <td><%#Eval("PizzaDescription")%></td>
                      <td><%#Eval("Category")%></td>
                      <td><%#Eval("Price")%></td>
                      <td><img src="<%#Eval("PizzaImagePath") %>" alt="Avatar" style="width:200px;border-radius:10px;">
                     </td>
                      <td><%#Eval("Discount")%></td>
                      <td><%#Eval("Tax")%></td>
                      <td><%#Eval("PizzaStatus")%></td>
                      <td> 
                          <a href="AdminUpdatePizza.aspx?pid=<%#Eval("PizzaMasterId") %>" class="w3-btn w3-green" style="text-decoration:none;">Update</a>
                      </td>
                      <td> 
                          <a href="AdminDeletePizza.aspx?pid=<%#Eval("PizzaMasterId") %>" class="w3-btn w3-red" style="text-decoration:none;">Delete</a>
                     </td>
                     
                  </tr>
            </ItemTemplate>

            <FooterTemplate></FooterTemplate>

            </asp:Repeater>

        </div>
    </div>


</asp:Content>
