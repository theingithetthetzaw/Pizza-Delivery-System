<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Pizza_Delivery_System.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="w3-container">

        <div class="row">
    
            <div class="col-md-3">
                 <div class="panel panel-info">
                  <div class="panel-heading"><h1>Total Pizza</h1></div>
                  <div class="panel-body"> 
                     <h1>
                     <p>
                        <span class="w3-tag w3-jumbo w3-padding-large w3-white"> 
                        <asp:Label ID="txtTotalPizza" runat="server" Text="0"></asp:Label>
                       </span>

                         <h4><a href="AdminViewPizza.aspx" class="w3-right">View Pizza</a></h4>
               
                    </p>
                    </h1>
                  </div>
                </div>
             </div>

        

            <div class="col-md-3">
                 <div class="panel panel-warning">
                  <div class="panel-heading"><h1>Processing Order</h1></div>
                  <div class="panel-body"> 
                     <h1>
                     <p>
                        <span class="w3-tag w3-jumbo w3-padding-large w3-white"> 
                        <asp:Label ID="TotalProcessingPizza" runat="server" Text="0"></asp:Label>
                       </span>
                        
                         <h4><a href="AdminViewProcessingOrder.aspx" class="w3-right">View Order</a></h4>
                    </p>
                    </h1>
                  </div>
                
                </div>
                </div>
          


            <div class="col-md-3">
                 <div class="panel panel-success">
                  <div class="panel-heading"><h1>Completed Order</h1></div>
                  <div class="panel-body"> 
                     <h1>
                     <p>
                        <span class="w3-tag w3-jumbo w3-padding-large w3-white"> 
                        <asp:Label ID="TotalCompletedPizza" runat="server" Text="0"></asp:Label>
                       </span>

                          <h4><a href="AdminViewCompletedOrder.aspx" class="w3-right">View Order</a></h4>
                  
                    </p>
                    </h1>
                  </div>
                </div>
            </div>
        
       </div>
    
</asp:Content>
