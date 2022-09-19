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
    public partial class CustomerInfo : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PizzaDBConnectionString"].ConnectionString);

        SqlCommand cmd = null;

        SqlDataAdapter da;

        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["User"] == null || Session["User"] == "Admin")
            {
                Server.Transfer("~/Home.aspx");
            }

            if (!IsPostBack)
            {
             
                con.Open();

                string s = "select * from CustomerMaster where EmailId='"+Session["EmailId"].ToString()+"'";

                cmd = new SqlCommand(s, con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();
                    
                    txtName.Text = dr.GetValue(1).ToString();
                    
                    if(dr.GetValue(2).ToString() == "True")
                    {
                        rbtnGender.Items[0].Selected = true;
                    }
                    else
                    {
                        rbtnGender.Items[1].Selected = true;
                    }

                    txtMobile.Text = dr.GetValue(3).ToString();

                    txtEmail.Text = dr.GetValue(4).ToString();

                    txtAddress.Text = dr.GetValue(5).ToString();

                    DropDownListCity.SelectedValue = dr.GetValue(6).ToString();

                    txtPincode.Text = dr.GetValue(7).ToString();


                }
                con.Close();
            }
        }

        protected void btnUpdateInfo_Click(object sender, EventArgs e)
        {
            con.Open();

            cmd = new SqlCommand("update CustomerMaster set CustomerName=@cname,Gender=@gender,MobileNumber=@mobile,Address=@address,LinkToCityMasterId=@city,Pincode=@pin where EmailId = '"+Session["EmailId"].ToString()+"'",con);

            cmd.Parameters.AddWithValue("@cname",txtName.Text);
            cmd.Parameters.AddWithValue("@gender",rbtnGender.SelectedValue);
            cmd.Parameters.AddWithValue("@mobile",txtMobile.Text);
            cmd.Parameters.AddWithValue("@address",txtAddress.Text);
            cmd.Parameters.AddWithValue("@city",DropDownListCity.SelectedValue);
            cmd.Parameters.AddWithValue("@pin",txtPincode.Text);
        
            
            cmd.ExecuteNonQuery();
            
            con.Close();

            Response.Write("<script>alert('Profile Updated Successfully..')</script>");
        }
    }
}