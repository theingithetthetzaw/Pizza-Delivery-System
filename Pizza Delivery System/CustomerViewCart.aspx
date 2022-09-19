<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerViewCart.aspx.cs" Inherits="Pizza_Delivery_System.CustomerViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container-fluid row">
            
           <asp:Repeater ID="PizzaViewCart" runat="server">

            <HeaderTemplate>

                <table class="table table-hover text-center">

                  <tr>
                      
                      <th class="text-center">Pizza Name</th>
                      <th class="text-center">Price</th>
                      <th class="text-center">Image</th>
                     <!-- <th class="text-center">Quntity</th>-->
                      <th class="text-center">Action</th>
                      <th class="text-center">Action</th>
                  </tr>


            </HeaderTemplate>

            <ItemTemplate>

                  <tr>
                      <td><asp:Label ID="PizzaName" runat="server" Text=<%#Eval("PizzaName")%>></asp:Label></td>
                      <td><asp:Label ID="PizzaPrice" runat="server" Text=<%#Eval("PizzaPrice")%>></asp:Label></td>
                      <td><img src="<%#Eval("PizzaImagePath") %>" alt="Avatar" style="width:200px;border-radius:10px;"></td>
               <!--       <td><asp:Label ID="Label1" runat="server" Text=></asp:Label></td>-->
                      <td><a class="btn btn-primary" href="CustomerViewOrder.aspx?pid=<%#Eval("PizzaMasterId") %>">Order Now</td>
                      <td><a class="btn btn-danger" href="CustomerDeletePizzaFromCart.aspx?pid=<%#Eval("PizzaMasterId") %>">Delete</td>
                        
                  </tr>

            </ItemTemplate>

            <FooterTemplate> </FooterTemplate>

            </asp:Repeater>

            <a href="CustomerDashboard.aspx" style="text-decoration:none;" class="w3-btn w3-blue w3-right">Add More Pizza</a>

         </div>

        

</asp:Content>
