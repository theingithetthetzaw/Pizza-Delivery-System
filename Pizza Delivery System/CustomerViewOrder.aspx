<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerViewOrder.aspx.cs" Inherits="Pizza_Delivery_System.CustomerViewOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="row" >
            
            <asp:Repeater ID="Pizza" runat="server"  >

            <HeaderTemplate></HeaderTemplate>

            <ItemTemplate>

            <div class="col-md-offset-2 col-sm-3" style="padding:20px 20px;">

             
                  <img src="<%#Eval("PizzaImagePath") %>" style="width:100%;border-radius:10px;">
                  
            </div>

                 <div class="col-md-3 col-sm-3" style="padding:20px 20px;">

                  <center><h3 class="well"><%#Eval("PizzaName")%></h3></center>

                  <h6><b>Description :</b> <%#Eval("PizzaDescription") %></h6>
            
                  <h6><b>Discount :</b> <asp:Label ID="txtDiscount" runat="server" Text=<%#Eval("Discount") %>></asp:Label>%</h6>

                  <h6><b>Tax :</b> <asp:Label ID="txtTax" runat="server" Text=<%#Eval("Tax") %>></asp:Label>%</h6>
                           
                  <h6><b>Price :</b> <%#Eval("Price") %> Rs.</h6>
                  <br>
                  <h6><b>Item :<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="qty"  runat="server" ErrorMessage="Please Enter Quantity"></asp:RequiredFieldValidator></b> <asp:TextBox ID="qty" runat="server" OnTextChanged="GetTotalAmount" CssClass="form-control" AutoPostBack="True" TextMode="Number"></asp:TextBox></h6>
               
                
                <center>

                  <asp:Button ID="btnAddOrder" runat="server" Text="Confirm Order" class="w3-btn w3-green" OnClick="AddOrder" />
                   
                  <a href="CustomerMyOrder.aspx" class="w3-text-blue">View Orders</a>
              
                </center> 

            </div>
                
            </ItemTemplate>

            <FooterTemplate></FooterTemplate>

            </asp:Repeater>

        <div class="col-md-3">
               <br>
               <h6><b>Delivery Address :</b> <asp:Label ID="txtAddress" runat="server" Text="Label"></asp:Label></h6>
                <a href="CustomerInfo.aspx" class="w3-text-blue">Change Address</a>
               <br><br>
               <h6><b>Net Price:</b><br><br> <asp:TextBox ID="txtNetPrice" runat="server" CssClass="form-control" ReadOnly="True" AutoPostBack="True" OnTextChanged="txtNetPrice_TextChanged"></asp:TextBox></h6>
               
        </div>        

        </div>



   


</asp:Content>
