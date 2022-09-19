<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Pizza_Delivery_System.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pizza Delivery</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		
    <link rel="stylesheet" href="bootstrap/css/w3.css">

	<script src="bootstrap/js/jquery.min.js"></script>
	
	<script src="bootstrap/js/bootstrap.min.js"></script>

</head>

<body>
   
   <form id="form1" runat="server">

   <div class="container-fluid">

      <div class="page-header">

            <h2>Pizza Delivery</h2>

      </div>
     
      <div class="row">

          <div class="col-md-8">

              <img src="SiteImages/p2.jpg" style="width:100%;"/>

          </div>
    
          <div class="col-md-4">

              <div class="panel panel-default">
                  
                  <div class="panel-heading"><h3>Sign In</h3></div>
                  
                  <div class="panel-body">

                      
                      <div class="form-group">
                        Email Id:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtEmailId" ForeColor="Red"></asp:RequiredFieldValidator><br><br>
                        <asp:TextBox ID="txtEmailId" class="form-control" runat="server"></asp:TextBox>
                      </div>

                      <div class="form-group">
                        Password:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator><br><br>
                        <asp:TextBox ID="txtPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                      </div>
                      <asp:Button ID="btnSignIn" runat="server" Text="Submit" class="btn btn-warning" style="width:100%;" OnClick="btnSignIn_Click"/>
                     
                      <br><br>
                      <center><a href="SignUp.aspx" style="text-decoration:none;">Sign Up</a></center>

                  </div>
              </div>

          </div>
          
      </div> 

    </div>
       <br><br>
     <div class="container-fluid row">
            
           <asp:Repeater ID="Feedback" runat="server">

            <HeaderTemplate>

                <table class="table table-hover text-center table-bordered">

                  <tr>
                      
                      <th class="text-center">Feedback</th>
                       <th class="text-center">Customer Name</th>
                  </tr>


            </HeaderTemplate>

            <ItemTemplate>

                  <tr>
                      <td><asp:Label ID="Feedback" runat="server" Text=<%#Eval("Feedback")%>></asp:Label></td>
                     <td><asp:Label ID="Label1" runat="server" Text=<%#Eval("CustomerName")%>></asp:Label></td>
                  
                  </tr>

            </ItemTemplate>

            <FooterTemplate> </FooterTemplate>

            </asp:Repeater>

          
         </div>

    </form>

</body>
</html>
