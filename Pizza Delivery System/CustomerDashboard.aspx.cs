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
    public partial class CustomerDashboard : System.Web.UI.Page
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
                getPizza("");
            }
        }

      

        public void getPizza(string SearchPizza)
        {
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from PizzaMaster where PizzaStatus = 'Active' and PizzaName like '%" + SearchPizza + "%'", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            Pizza.DataSource = dt;

            Pizza.DataBind();

            con.Close();
        }


        protected void btnPizzaType_Click(object sender, EventArgs e)
        {
            getPizzaAccordingType(DropDownListPizzaType.SelectedValue);
        }

        public void getPizzaAccordingType(string Type)
        {
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from PizzaMaster where Category = '"+Type+"' and PizzaStatus = 'Active'", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            Pizza.DataSource = dt;

            Pizza.DataBind();

            con.Close();

            return;
        }

        protected void btnSearchPizza_Click(object sender, EventArgs e)
        {
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from PizzaMaster where PizzaStatus = 'Active' and PizzaName like '%" + txtSearchPizza.Text + "%'", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            Pizza.DataSource = dt;

            Pizza.DataBind();

            con.Close();

            return;
        }


    

    }
}