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
    public partial class AdminChangePassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PizzaDBConnectionString"].ConnectionString);

        SqlCommand cmd = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"] == "Customer")
            {
                Server.Transfer("~/Home.aspx");
            }
        }

        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            con.Open();

            cmd = new SqlCommand("select * from AdminMaster where AdminMasterEmailId=@id and AdminMasterPassword=@pass", con);

            cmd.Parameters.AddWithValue("@pass", txtCurrentPass.Text);

            cmd.Parameters.AddWithValue("@id", Session["EmailId"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            da.Fill(dt);

            if (dt.Rows.Count != 1)
            {
                Response.Write("<script>alert('Current Password Is Wrong Try Again..')</script>");
            }
            else
            {
                cmd = new SqlCommand("update AdminMaster set AdminMasterPassword=@pass where AdminMasterEmailId=@id", con);

                cmd.Parameters.AddWithValue("@pass", txtNewPass.Text);

                cmd.Parameters.AddWithValue("@id", Session["EmailId"].ToString());

                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Password Changed Successfully..')</script>");
            }

            con.Close();
        }
    }
}