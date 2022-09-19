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
    public partial class AdminViewProcessingOrder : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PizzaDBConnectionString"].ConnectionString);

        SqlCommand cmd = null;

        SqlDataAdapter da;

        DataTable dt;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"] == "Customer")
            {
                Server.Transfer("~/Home.aspx");
            }

            if (!IsPostBack)
            {
                getPizzaBill("");
            }
        }


        public void getPizzaBill(string SearchPizza)
        {
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from BillMaster LEFT JOIN PizzaMaster ON BillMaster.LinkToPizzaMasterId = PizzaMaster.PizzaMasterId LEFT JOIN CustomerMaster ON BillMaster.LinkToCustomerMasterId = CustomerMaster.CustomerMasterId where Status = 'Processing'", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            Pizza.DataSource = dt;

            Pizza.DataBind();

            con.Close();
        }


    }

}