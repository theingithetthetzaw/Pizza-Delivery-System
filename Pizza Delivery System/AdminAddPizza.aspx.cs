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
    public partial class AdminAddPizza : System.Web.UI.Page
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
            string path = Path.GetFileName(PizzaImage.FileName);

            Random rd = new Random();

            path = rd.Next(1000000000).ToString() + path;

            PizzaImage.SaveAs(Server.MapPath("~/Images/") + path);

            con.Open();

            cmd = new SqlCommand("insert into PizzaMaster (PizzaName,PizzaDescription,Category,Price,PizzaImagePath,PizzaStatus,Discount,Tax) values (@PizzaName,@PizzaDescription,@Category,@Price,@PizzaImagePath,@PizzaStatus,@Discount,@Tax)", con);

            cmd.Parameters.AddWithValue("@PizzaName", txtPizzaName.Text);
            cmd.Parameters.AddWithValue("@PizzaDescription", txtPizzaDescription.Text);
            cmd.Parameters.AddWithValue("@Category", rbtnCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@Price", txtPizzaPrice.Text);
            cmd.Parameters.AddWithValue("@PizzaImagePath", "Images/" + path);
            cmd.Parameters.AddWithValue("@Discount",Convert.ToInt32(txtDiscount.Text));
            cmd.Parameters.AddWithValue("@Tax", Convert.ToInt32(txtTax.Text));
            cmd.Parameters.AddWithValue("@PizzaStatus",rbtnStatus.SelectedValue);

           
            cmd.ExecuteNonQuery();

            con.Close();

            Response.Write("<script>alert('Pizza Added Successfully..')</script>");

            txtPizzaName.Text = "";
            txtPizzaDescription.Text = "";
            txtPizzaPrice.Text = "";
            txtDiscount.Text = "";
            txtTax.Text = "";
         
        }
    }
}