<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminViewProcessingOrder.aspx.cs" Inherits="Pizza_Delivery_System.AdminViewProcessingOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div class="w3-container">

        <br><br>
        <div class="row" >
            <asp:Repeater ID="Pizza" runat="server" >

            <HeaderTemplate>

                <table class="table table-hover text-center">

                  <tr>
                      <th class="text-center">Bill Id</th>
                      <th class="text-center">Date</th>
                      <th class="text-center">Image</th>
                      <th class="text-center">Pizza</th>
                      <th class="text-center">Customer</th>
                      <th class="text-center">Quantity</th>
                      <th class="text-center">Discount</th>
                      <th class="text-center">Tax</th>
                      <th class="text-center">Status</th>
                      <th class="text-center">Total Amount</th>
                      <th class="text-center">Confirm</th>

                  </tr>


            </HeaderTemplate>

            <ItemTemplate>

                  <tr>
                      <td><%#Eval("BillMasterId")%></td>
                      <td><%#Eval("BillDate")%></td>
                      <td><img src="<%#Eval("PizzaImagePath") %>" alt="Avatar" style="width:200px;border-radius:10px;"></td>
                      <td><%#Eval("PizzaName")%></td>
                      <td><%#Eval("CustomerName")%></td>
                      <td><%#Eval("qty")%></td>
                      <td><%#Eval("BillDiscount")%></td>
                      <td><%#Eval("Tax")%></td>
                      <td><%#Eval("Status")%></td>
                      <td><%#Eval("TotalAmount")%></td>
                      <td> 
                          <a href="AdminConfirmOrder.aspx?billid=<%#Eval("BillMasterId")%>" class="w3-btn w3-green" style="text-decoration:none;">Confirm</a>
                      </td>
                  
                     
                  </tr>
            </ItemTemplate>

            <FooterTemplate></FooterTemplate>

            </asp:Repeater>

        </div>
    </div>


</asp:Content>
