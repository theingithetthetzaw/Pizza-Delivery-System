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
    public partial class CustomerViewOrder : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PizzaDBConnectionString"].ConnectionString);

        SqlCommand cmd = null;

        SqlDataAdapter da;

        DataTable dt;

        string pid;

        int AfterDiscount, AfterTax;



        public string pname { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"] == "Admin")
            {
                Server.Transfer("~/Home.aspx");
            }

            if (!IsPostBack)
            {
                pid = Request.QueryString["pid"].ToString();

                Session["OrderPizzaId"] = pid;

                con.Open();

                da = new SqlDataAdapter("select * from PizzaMaster where PizzaMasterId=" + Convert.ToInt32(pid) + "", con);

                dt = new DataTable();

                da.Fill(dt);

                Pizza.DataSource = dt;

                Pizza.DataBind();

                cmd = new SqlCommand("select * from PizzaMaster where PizzaMasterId=" + Convert.ToInt32(pid) + "", con);
                
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();

                    AfterDiscount = Convert.ToInt32(dr.GetValue(4).ToString()) - (Convert.ToInt32(dr.GetValue(4).ToString()) * Convert.ToInt32(dr.GetValue(7).ToString()) / 100);

                    AfterTax = AfterDiscount + (AfterDiscount * Convert.ToInt32(dr.GetValue(8).ToString()) / 100);

                    Session["AfterTax"] = AfterTax.ToString();

                    txtNetPrice.Text = AfterTax.ToString();

                }

                con.Close();

                txtAddress.Text = Session["Address"].ToString();
            }
        }

        protected void AddOrder(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            string qty = (item.FindControl("qty") as TextBox).Text;

            string discount = (item.FindControl("txtDiscount") as Label).Text;

            string tax = (item.FindControl("txtTax") as Label).Text;

          
            con.Open();

            cmd = new SqlCommand("insert into BillMaster (LinkToCustomerMasterId,LinkToPizzaMasterId,BillDate,BillDiscount,Tax,Status,TotalAmount,qty) values ("+Convert.ToInt32(Session["CustomerId"].ToString())+",'"+Convert.ToInt32(Session["OrderPizzaId"].ToString())+"','"+DateTime.Now.Date.ToShortDateString()+"','"+Convert.ToInt32(discount)+"','"+Convert.ToInt32(tax)+"','Processing','"+txtNetPrice.Text+"','"+qty+"')",con);

            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Order Added Successfully...')</script>");

            con.Close();
        }

        protected void GetTotalAmount(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as TextBox).NamingContainer as RepeaterItem;

            string qty = (item.FindControl("qty") as TextBox).Text;

            txtNetPrice.Text = (Convert.ToInt32(Session["AfterTax"].ToString()) * Convert.ToInt32(qty)).ToString();

        }

        protected void txtNetPrice_TextChanged(object sender, EventArgs e)
        {

        }

    
    }
}