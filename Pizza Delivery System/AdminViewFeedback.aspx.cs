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
    public partial class AdminViewFeedback : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PizzaDBConnectionString"].ConnectionString);

        SqlCommand cmd = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"] == "Customer")
            {
                Server.Transfer("~/Home.aspx");
            }

            if (!IsPostBack)
            {
                getFeedback();
            }
        }

        public void getFeedback()
        {
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select FeedbackMaster.*,CustomerMaster.CustomerName from FeedbackMaster,CustomerMaster where FeedbackMaster.LinkToCustomerId = CustomerMaster.CustomerMasterId", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            Feedback.DataSource = dt;

            Feedback.DataBind();

            con.Close();
        }
    }
}