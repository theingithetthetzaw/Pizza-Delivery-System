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
    public partial class AdminDeleteFeedback : System.Web.UI.Page
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

            int fid = Convert.ToInt32(Request.QueryString["fid"].ToString());

            con.Open();

            cmd = new SqlCommand("delete from FeedbackMaster where FeedbackMasterId = " + fid + "", con);

            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Feedback Deleted..')</script>");

            Response.Redirect("AdminViewFeedback.aspx");

            con.Close();
        }
    }
}