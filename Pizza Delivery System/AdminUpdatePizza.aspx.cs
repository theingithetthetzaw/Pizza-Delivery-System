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
    public partial class AdminUpdateDeletePizza : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PizzaDBConnectionString"].ConnectionString);

        SqlCommand cmd = null;

        SqlDataAdapter da;

        DataTable dt;

        int pid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"] == "Customer")
            {
                Server.Transfer("~/Home.aspx");
            }

            if (!IsPostBack)
            {
                pid = Convert.ToInt32(Request.QueryString["pid"].ToString());
                Session["UpdatePizzaId"] = pid.ToString();
                con.Open();
              
                string s = "select * from PizzaMaster where PizzaMasterId=" + Convert.ToInt32(Request.QueryString["pid"].ToString());
                
                cmd = new SqlCommand(s, con);
                
                SqlDataReader dr = cmd.ExecuteReader();
                
                if (dr.HasRows)
                {
                    dr.Read();
                    txtPizzaName.Text = dr.GetValue(2).ToString();
                    txtPizzaDescription.Text = dr.GetValue(3).ToString();
                    txtPizzaPrice.Text = dr.GetValue(4).ToString();
                    txtDiscount.Text = dr.GetValue(7).ToString();
                    txtTax.Text = dr.GetValue(8).ToString();
                   // DropDownListCategory.SelectedValue = dr.GetValue(1).ToString();

                    if (dr.GetValue(6).ToString() == "Active")
                    {
                        rbtnStatus.SelectedValue = "Active";
                    }
                    else
                    {
                        rbtnStatus.SelectedValue = "Deactive";
                    }

                    if (dr.GetValue(1).ToString() == "Veg")
                    {
                        rbtnCategory.SelectedValue = "Veg";
                    }
                    else
                    {
                        rbtnCategory.SelectedValue = "Non-Veg";
                    }

                }
                con.Close();
            }
        }
        protected void UpdatePizza_Click(object sender, EventArgs e)
        {
            string path = Path.GetFileName(PizzaImage.FileName);

            Random rd = new Random();

            path = rd.Next(1000000000).ToString() + path;

            PizzaImage.SaveAs(Server.MapPath("~/Images/") + path);

            con.Open();
            
            if(!PizzaImage.HasFile)
            {
                cmd = new SqlCommand("update PizzaMaster set PizzaName=@PizzaName,PizzaDescription=@PizzaDescription,Category=@Category,Price=@Price,PizzaStatus=@PizzaStatus,Discount=@Discount,Tax=@Tax where PizzaMasterId=@pid", con);
                cmd.Parameters.AddWithValue("@PizzaName", txtPizzaName.Text);
                cmd.Parameters.AddWithValue("@PizzaDescription", txtPizzaDescription.Text);
                cmd.Parameters.AddWithValue("@Category", rbtnCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Price", Convert.ToInt32(txtPizzaPrice.Text));
                cmd.Parameters.AddWithValue("@Discount", Convert.ToInt32(txtDiscount.Text));
                cmd.Parameters.AddWithValue("@Tax", Convert.ToInt32(txtTax.Text));
                cmd.Parameters.AddWithValue("@PizzaStatus", rbtnStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@pid", Convert.ToInt32(Session["UpdatePizzaId"].ToString()));
            }
            else
            {
                cmd = new SqlCommand("UPDATE PizzaMaster SET PizzaName=@PizzaName,PizzaDescription=@PizzaDescription,Category=@Category,Price=@Price,PizzaImagePath=@PizzaImagePath,PizzaStatus=@PizzaStatus,Discount=@Discount,Tax=@Tax where PizzaMasterId=@pid", con);
                cmd.Parameters.AddWithValue("@PizzaName", txtPizzaName.Text);
                cmd.Parameters.AddWithValue("@PizzaDescription", txtPizzaDescription.Text);
                cmd.Parameters.AddWithValue("@Category", rbtnCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Price", txtPizzaPrice.Text);
                cmd.Parameters.AddWithValue("@PizzaImagePath", "Images/" + path);
                cmd.Parameters.AddWithValue("@Discount", Convert.ToInt32(txtDiscount.Text));
                cmd.Parameters.AddWithValue("@Tax", Convert.ToInt32(txtTax.Text));
                cmd.Parameters.AddWithValue("@PizzaStatus", rbtnStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@pid", Convert.ToInt32(Session["UpdatePizzaId"].ToString()));
        
            }



            cmd.ExecuteNonQuery();
            con.Close();

            Response.Write("<script>alert('Pizza Updated Successfully..')</script>");

            txtPizzaName.Text = "";
            txtPizzaDescription.Text = "";
            txtPizzaPrice.Text = "";
            txtDiscount.Text = "";
            txtTax.Text = "";
        }
    }
}