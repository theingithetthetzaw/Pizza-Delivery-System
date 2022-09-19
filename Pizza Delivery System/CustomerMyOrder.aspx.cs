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
    public partial class CustomerMyOrder : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PizzaDBConnectionString"].ConnectionString);

        SqlCommand cmd = null;

        SqlDataAdapter da;

        DataTable dt;

        string pid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"] == "Admin")
            {
                Server.Transfer("~/Home.aspx");
            }

            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    getPizzaBill("");
                }
            }
        }

        public void getPizzaBill(string SearchPizza)
        {
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from BillMaster LEFT JOIN PizzaMaster ON BillMaster.LinkToPizzaMasterId = PizzaMaster.PizzaMasterId where LinkToCustomerMasterId =" + Convert.ToInt32(Session["CustomerId"].ToString()) + " and Status = 'Processing'", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            Pizza.DataSource = dt;

            Pizza.DataBind();

            da = new SqlDataAdapter("select * from BillMaster LEFT JOIN PizzaMaster ON BillMaster.LinkToPizzaMasterId = PizzaMaster.PizzaMasterId where LinkToCustomerMasterId =" + Convert.ToInt32(Session["CustomerId"].ToString()) + " and Status = 'Completed'", con);

            dt = new DataTable();

            da.Fill(dt);

            RepeaterConfirm.DataSource = dt;

            RepeaterConfirm.DataBind();

            con.Close();
        }
    }
}