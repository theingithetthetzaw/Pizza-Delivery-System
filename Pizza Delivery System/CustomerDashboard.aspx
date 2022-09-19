<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerDashboard.aspx.cs" Inherits="Pizza_Delivery_System.CustomerDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="w3-container">

        <div class="row">
            <div class="col-md-3"> 
                <div class="col-md-10">
                     <asp:TextBox ID="txtSearchPizza" runat="server" CssClass="w3-input" placeholder="Search Pizza"  TextMode="Search"></asp:TextBox>
                </div>
                  <div class="col-md-2">
                <asp:Button ID="btnSearchPizza" runat="server" Text="Search" class="w3-btn w3-black"  OnClick="btnSearchPizza_Click" />
                 </div>
            </div>

            <div class="col-md-offset-1 col-md-3"> 

                <div class="col-md-10">
                <asp:DropDownList ID="DropDownListPizzaType" runat="server" CssClass="form-control">
                    <asp:ListItem>Veg</asp:ListItem>
                    <asp:ListItem>Non-Veg</asp:ListItem>
                </asp:DropDownList>
                </div>
                <div class="col-md-2">
                <asp:Button ID="btnPizzaType" runat="server" Text="Search" class="w3-btn w3-black"  OnClick="btnPizzaType_Click"/>
                    </div>
            </div>


        </div>

       
        <div class="row" >
            <asp:Repeater ID="Pizza" runat="server">

            <HeaderTemplate></HeaderTemplate>

            <ItemTemplate>

            <div class="col-md-3 col-sm-3" style="padding:20px 20px;">

                  <center><h3 class="page-header"><%#Eval("PizzaName")%></h3></center>

                  <img src="<%#Eval("PizzaImagePath") %>" alt="Avatar" style="width:100%;border-radius:10px;">
                  
              
                  <center><h6><b>Price :</b> <%#Eval("Price") %></h6></center>
                  
                 
                <center>


                    <a href="CustomerAddCart.aspx?pid=<%#Eval("PizzaMasterId") %>" class="w3-btn w3-green" style="text-decoration:none;">Add Cart</a>
                
                    <a href="CustomerViewOrder.aspx?pid=<%#Eval("PizzaMasterId") %>" class="w3-btn w3-blue" style="text-decoration:none;">Order Now</a>
              

                </center> 
            </div>

            </ItemTemplate>

            <FooterTemplate></FooterTemplate>

            </asp:Repeater>

        </div>
    </div>
</asp:Content>
