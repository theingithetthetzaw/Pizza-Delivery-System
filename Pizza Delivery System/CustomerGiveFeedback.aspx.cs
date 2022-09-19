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
    public partial class CustomerGiveFeedback : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PizzaDBConnectionString"].ConnectionString);

        SqlCommand cmd = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"] == "Admin")
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

            SqlDataAdapter da = new SqlDataAdapter("select * from FeedbackMaster where LinkToCustomerId="+Convert.ToInt32(Session["CustomerId"].ToString())+"",con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            Feedback.DataSource = dt;

            Feedback.DataBind();

            con.Close();
        }

        protected void btnAddFeedback_Click(object sender, EventArgs e)
        {
            con.Open();

            cmd = new SqlCommand("insert into FeedbackMaster (Feedback,LinkToCustomerId) values (@Feedback, @LinkToCustomerId)",con);

            cmd.Parameters.AddWithValue("@Feedback",txtFeedback.Text);

            cmd.Parameters.AddWithValue("@LinkToCustomerId", Convert.ToInt32(Session["CustomerId"].ToString()));

            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Feedback Added..')</script>");

            con.Close();

            getFeedback();
        }
    }
}