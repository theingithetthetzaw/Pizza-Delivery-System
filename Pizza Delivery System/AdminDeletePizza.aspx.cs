﻿using System;
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
    public partial class AdminDeletePizza : System.Web.UI.Page
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



            con.Open();
          
            string s = "delete PizzaMaster where PizzaMasterId=" + Convert.ToInt32(Request.QueryString["pid"].ToString());
            
            cmd = new SqlCommand(s, con);
            
            cmd.ExecuteNonQuery();
            
            Response.Redirect("~/AdminViewPizza.aspx");
        }
    }
}