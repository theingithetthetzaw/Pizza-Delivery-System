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
    public partial class CustomerAddCart : System.Web.UI.Page
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

                SqlDataAdapter da = new SqlDataAdapter("select * from PizzaMaster where PizzaMasterId = '" + Request.QueryString["pid"] + "'", con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                Pizza.DataSource = dt;

                Pizza.DataBind();

                con.Close();

               
              
            }
        }

    
        protected void AddCart(object sender ,EventArgs e)
        {

            try
            {

            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            string pid = (item.FindControl("Pid") as Label).Text;
            string pname = (item.FindControl("PizzaName") as Label).Text;
            string pprice = (item.FindControl("PizzaPrice") as Label).Text;
            string pimage = (item.FindControl("PizzaImage") as Label).Text;
            string qty = (item.FindControl("txtQuantity") as TextBox).Text;

           
                if (Convert.ToInt32(qty) > 0)
                {

                    if (Request.Cookies[Session["EmailId"].ToString()] == null)
                    {

                        Response.Cookies[Session["EmailId"].ToString()].Value = pid + "," + pname + "," + pprice + "," + pimage + "," +qty;

                        Response.Cookies[Session["EmailId"].ToString()].Expires = DateTime.Now.AddDays(1);

                        Response.Write("<script>alert('Pizza Added Successfully..')</script>");
                  
                    }
                    else
                    {
                        Response.Cookies[Session["EmailId"].ToString()].Value = Request.Cookies[Session["EmailId"].ToString()].Value + "|" + pid + "," + pname + "," + pprice + "," + pimage + "," + qty;

                        Response.Cookies[Session["EmailId"].ToString()].Expires = DateTime.Now.AddDays(1);

                        Response.Write("<script>alert('Pizza Added Successfully..')</script>");

                    }

                    Response.Redirect("CustomerViewCart.aspx");
                  
                }
                else
                { 
                    Response.Write("<script>alert('Please Enter Quantity More Then 0')</script>");
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex);
           
            }
        }

        protected void Pizza_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

     

     

        


      
    }
}