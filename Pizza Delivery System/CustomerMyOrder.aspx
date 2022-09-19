<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerMyOrder.aspx.cs" Inherits="Pizza_Delivery_System.CustomerMyOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="w3-container">

        <br><br>
        <div class="row" >
            <center><h3 style="color:green;">Order List</h3></center>

            <asp:Repeater ID="Pizza" runat="server" >

            <HeaderTemplate>

                <table class="table table-hover text-center table-bordered">

                  <tr>
                      <th class="text-center">Bill Id</th>
                      <th class="text-center">Date</th>
                      <th class="text-center">Pizza</th>
                      <th class="text-center">Image</th>
                      <th class="text-center">Quantity</th>
                      <th class="text-center">Discount</th>
                      <th class="text-center">Tax</th>
                      <th class="text-center">Status</th>
                      <th class="text-center">Total Amount</th>
                      <th class="text-center">Cancel</th>

                  </tr>


            </HeaderTemplate>

            <ItemTemplate>

                  <tr>
                      <td><%#Eval("BillMasterId")%></td>
                      <td><%#Eval("BillDate")%></td>
                      <td><%#Eval("PizzaName")%></td>
                      <td><img src="<%#Eval("PizzaImagePath") %>" alt="Avatar" style="width:200px;border-radius:10px;"></td>
                      <td><%#Eval("qty")%></td>
                      <td><%#Eval("BillDiscount")%></td>
                      <td><%#Eval("Tax")%></td>
                      <td><%#Eval("Status")%></td>
                      <td><%#Eval("TotalAmount")%></td>
                      <td> 
                          <a href="CustomerCancelOrder.aspx?billid=<%#Eval("BillMasterId")%>" class="w3-btn w3-red" style="text-decoration:none;">Cancel Order</a>
                      </td>
                  
                     
                  </tr>
            </ItemTemplate>

            <FooterTemplate></FooterTemplate>

            </asp:Repeater>

        </div>



        <div class="row" >

         

            <asp:Repeater ID="RepeaterConfirm" runat="server" >

            <HeaderTemplate>

                <table class="table table-hover text-center table-bordered">

                  <tr>
                      <th class="text-center">Bill Id</th>
                      <th class="text-center">Date</th>
                      <th class="text-center">Pizza</th>
                      <th class="text-center">Image</th>
                      <th class="text-center">Quantity</th>
                      <th class="text-center">Discount</th>
                      <th class="text-center">Tax</th>
                      <th class="text-center">Status</th>
                      <th class="text-center">Total Amount</th>
                      <!--<th class="text-center">Cancel</th>-->

                  </tr>


            </HeaderTemplate>

            <ItemTemplate>

                  <tr>
                      <td><%#Eval("BillMasterId")%></td>
                      <td><%#Eval("BillDate")%></td>
                      <td><%#Eval("PizzaName")%></td>
                      <td><img src="<%#Eval("PizzaImagePath") %>" alt="Avatar" style="width:200px;border-radius:10px;"></td>
                      <td><%#Eval("qty")%></td>
                      <td><%#Eval("BillDiscount")%></td>
                      <td><%#Eval("Tax")%></td>
                      <td><%#Eval("Status")%></td>
                      <td><%#Eval("TotalAmount")%></td>
                     
                  
                     
                  </tr>
            </ItemTemplate>

            <FooterTemplate></FooterTemplate>

            </asp:Repeater>

        </div>



    </div>



</asp:Content>
