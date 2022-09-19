<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerInfo.aspx.cs" Inherits="Pizza_Delivery_System.CustomerInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
          
          <div class="col-md-offset-4 col-md-4">

              <div class="panel panel-default">
                  
                  <div class="panel-heading"><h3>Your Info</h3></div>
                  
                  <div class="panel-body">

                      <div class="form-group">
                        Name:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator><br><br>
                        <asp:TextBox ID="txtName" class="form-control" runat="server"></asp:TextBox>
                      </div>

                      <div class="form-group">
                      
                         Gender:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="rbtnGender" ForeColor="Red"></asp:RequiredFieldValidator><br><br>
                          <asp:RadioButtonList ID="rbtnGender" runat="server" RepeatDirection="Horizontal" Font-Size="Small">
                           <asp:ListItem Value="1">Male</asp:ListItem>
                           <asp:ListItem Value="0">Female</asp:ListItem>
                          </asp:RadioButtonList>
                        </div>

                      <div class="form-group">
                        Mobile No:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Valide Number" ControlToValidate="txtMobile" ForeColor="Red" ValidationExpression="^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator><br><br>
                        <asp:TextBox ID="txtMobile" class="form-control" runat="server" TextMode="Phone"></asp:TextBox>
                      </div>

                      <div class="form-group">
                        Email Id:<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalide Email Id" Display="Dynamic" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator><br><br>
                        <asp:TextBox ID="txtEmail" class="form-control" runat="server" TextMode="Email" ReadOnly="True"></asp:TextBox>
                      </div>

                       <div class="form-group">
                        Address:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtAddress" ForeColor="Red"></asp:RequiredFieldValidator><br><br>
                        <asp:TextBox ID="txtAddress" class="form-control" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                      </div>

                      <div class="form-group">
                        City:<br><br>
        
                        <asp:DropDownList ID="DropDownListCity" runat="server" DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityMasterId" CssClass="form-control"></asp:DropDownList>
                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PizzaDBConnectionString %>" SelectCommand="SELECT * FROM [CityMaster]"></asp:SqlDataSource>
                      </div>
                      
                       <div class="form-group">
                        Pincode:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtPincode" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter Only 6 Digit Number" ControlToValidate="txtPincode" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator><br><br>
                        <asp:TextBox ID="txtPincode" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                      </div>

                    
                      <asp:Button ID="btnUpdateInfo" runat="server" Text="Update" class="btn btn-warning" style="width:100%;" OnClick="btnUpdateInfo_Click" />
                      
                    
                  </div>
              </div>

          </div>
          
      </div> 

</asp:Content>
