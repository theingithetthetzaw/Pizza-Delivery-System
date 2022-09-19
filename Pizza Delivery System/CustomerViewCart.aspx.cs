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
    public partial class CustomerViewCart : System.Web.UI.Page
    {
        int i;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PizzaDBConnectionString"].ConnectionString);

        SqlCommand cmd = null;

        SqlDataAdapter da;

        HttpCookie c;

        DataTable dt = new DataTable("CartOrder");

        DataColumn dc, dc1, dc2, dc3, dc4;

        DataRow dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null || Session["User"] == "Admin")
            {
                Server.Transfer("~/Home.aspx");
            }

            try
            {

                dc = new DataColumn("PizzaMasterId");
                dc.DataType = typeof(string);
                dc1 = new DataColumn("PizzaName");
                dc1.DataType = typeof(string);
                dc2 = new DataColumn("PizzaPrice");
                dc2.DataType = typeof(string);
                dc3 = new DataColumn("PizzaImagePath");
                dc3.DataType = typeof(string);
                dc4 = new DataColumn("PizzaQuantity");
                dc4.DataType = typeof(string);
                dt.Columns.Add(dc);
                dt.Columns.Add(dc1);
                dt.Columns.Add(dc2);
                dt.Columns.Add(dc3);
                dt.Columns.Add(dc4);

                string t, s;

                string[] a = new string[5];

                if (Request.Cookies[Session["EmailId"].ToString()] != null)
                {


                    s = Convert.ToString(Request.Cookies[Session["EmailId"].ToString()].Value);

                    string[] str = s.Split('|');

                    for (int i = 0; i < str.Length; i++)
                    {
                        t = Convert.ToString(str[i].ToString());

                        string[] str1 = t.Split(',');

                        for (int j = 0; j < str1.Length; j++)
                        {
                            a[j] = str1[j].ToString();
                        }

                        dt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), a[4].ToString());
                    }
                }

                PizzaViewCart.DataSource = dt;
                PizzaViewCart.DataBind();


            }
            catch (Exception ex) { }
        }
    }
}