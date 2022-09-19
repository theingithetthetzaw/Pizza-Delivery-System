using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration.Install;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace Pizza_Delivery_System
{
    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PizzaDBConnectionString"].ConnectionString);

        SqlCommand cmd = null;

        SqlDataAdapter da;

        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            con.Open();

            da = new SqlDataAdapter("select * from CustomerMaster where EmailId = '"+txtEmail.Text+"'", con);

            dt = new DataTable();

            da.Fill(dt);

            if(dt.Rows.Count == 1)
            {
                Response.Write("<script>alert('Email Id Already Exists..')</script>");

                return;
            }

            da = new SqlDataAdapter("select * from AdminMaster where AdminMasterEmailId = '" + txtEmail.Text + "'", con);

            dt = new DataTable();

            da.Fill(dt);

            if (dt.Rows.Count == 1)
            {
                Response.Write("<script>alert('Email Id Already Exists..')</script>");

                return;
            }


            cmd = new SqlCommand("insert into CustomerMaster (CustomerName,Gender,MobileNumber,EmailId,Address,LinkToCityMasterId,Pincode,Password) values (@CustomerName,@Gender,@MobileNumber,@EmailId,@Address,@LinkToCityMasterId,@Pincode,@Password)", con);
            
            cmd.Parameters.AddWithValue("@CustomerName",txtName.Text);
            cmd.Parameters.AddWithValue("@Gender",rbtnGender.SelectedValue);
            cmd.Parameters.AddWithValue("@MobileNumber",txtMobile.Text);
            cmd.Parameters.AddWithValue("@EmailId",txtEmail.Text);
            cmd.Parameters.AddWithValue("@Address",txtAddress.Text);
            cmd.Parameters.AddWithValue("@LinkToCityMasterId",DropDownListCity.SelectedValue);
            cmd.Parameters.AddWithValue("@Pincode",txtPincode.Text);
            cmd.Parameters.AddWithValue("@Password",txtPass.Text);

            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Registration Successfully...')</script>");

            Server.Transfer("~/Home.aspx");

            con.Close();
        }
    }
}