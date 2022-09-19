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
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PizzaDBConnectionString"].ConnectionString);

        SqlCommand cmd = null;

        SqlDataAdapter da;

        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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
        protected void btnSignIn_Click(object sender, EventArgs e)
        {

            con.Open();

            da = new SqlDataAdapter("select * from AdminMaster where AdminMasterEmailId = '"+txtEmailId.Text+"' and AdminMasterPassword = '"+txtPassword.Text+"'",con);

            dt = new DataTable();

            da.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                Session["User"] = "Admin";

                Session["EmailId"] = dr["AdminMasterEmailId"].ToString();

                Server.Transfer("~/AdminDashboard.aspx");
            }
        
            da = new SqlDataAdapter("select * from CustomerMaster where EmailId = '" + txtEmailId.Text + "' and Password = '" + txtPassword.Text + "'", con);

            dt = new DataTable();

            da.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                Session["User"] = "Customer";

                Session["CustomerId"] = dr["CustomerMasterId"].ToString();

                Session["EmailId"] = dr["EmailId"].ToString();

                Session["Address"] = dr["Address"].ToString();

                Server.Transfer("~/CustomerDashboard.aspx");
            }

            con.Close();

            Response.Write("<script>alert('Username Or Password Are Wrong..')</script>");

        }
    }
}