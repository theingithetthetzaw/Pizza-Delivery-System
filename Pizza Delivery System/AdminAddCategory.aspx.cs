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
    public partial class AdminAddCategory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PizzaDBConnectionString"].ConnectionString);

        SqlCommand cmd = null;



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"] == "Customer")
            {
                Server.Transfer("~/Home.aspx");
            }
        }

        protected void AddPizza_Click(object sender, EventArgs e)
        {
            con.Open();

            cmd = new SqlCommand("insert into CategoryMaster (CategoryName,VegNonVeg) values (@CategoryName,@VegNonVeg)", con);

            cmd.Parameters.AddWithValue("@CategoryName", txtPizzaCategoryName.Text);
            cmd.Parameters.AddWithValue("@VegNonVeg", rbtnType.SelectedValue);
           
            cmd.ExecuteNonQuery();

            con.Close();

            Response.Write("<script>alert('Category Added Successfully..')</script>");

            txtPizzaCategoryName.Text = "";
        }
    }
}