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
    public partial class AdminDashboard : System.Web.UI.Page
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

                con.Open();

                da = new SqlDataAdapter("select * from PizzaMaster", con);

                dt = new DataTable();

                da.Fill(dt);

                txtTotalPizza.Text = dt.Rows.Count.ToString();


                da = new SqlDataAdapter("select * from BillMaster where Status='Processing'", con);

                dt = new DataTable();

                da.Fill(dt);

                TotalProcessingPizza.Text = dt.Rows.Count.ToString();


                da = new SqlDataAdapter("select * from BillMaster where Status='Completed'", con);

                dt = new DataTable();

                da.Fill(dt);

                TotalCompletedPizza.Text = dt.Rows.Count.ToString();

                con.Close();
            }
        }
    }
}