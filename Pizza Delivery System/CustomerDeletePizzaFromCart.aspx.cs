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
    public partial class CustomerDeletePizzaFromCart : System.Web.UI.Page
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

            string pid = Request.QueryString["pid"];

            string t, s, copycart = null;

            string[] a = new string[5];

            string pid2;
            string pname;
            string pprice ;
            string pimage;
            string qty;

            int temp = 0,count=0;

            if (Request.Cookies[Session["EmailId"].ToString()] != null)
            {

                s = Convert.ToString(Request.Cookies[Session["EmailId"].ToString()].Value);

                string[] str = s.Split('|');

                for (int i = 0; i < str.Length; i++)
                {
                    count++;

                    t = Convert.ToString(str[i].ToString());

                    string[] str1 = t.Split(',');

                    for (int j = 0; j < str1.Length; j++)
                    {
                        a[j] = str1[j].ToString();
                    }

                    if (a[0].ToString() != pid)
                    {
                        pid2 = a[0].ToString();
                        pname = a[1].ToString();
                        pprice = a[2].ToString();
                        pimage = a[3].ToString();
                        qty = a[4].ToString();

                        if (i == 0 || temp == 1)
                        {
                            copycart = pid2 + "," + pname + "," + pprice + "," + pimage + "," + qty;
                            temp = 0;
                        }
                        else
                        {
                            copycart += "|" + pid2 + "," + pname + "," + pprice + "," + pimage + "," + qty;
                        }

                    }
                    else if (i == 0 && a[0].ToString() == pid)
                    {
                        temp = 1;
                    }

                }

                if (count == 1)
                {
                    Response.Cookies[Session["EmailId"].ToString()].Value = null;

                    Response.Cookies[Session["EmailId"].ToString()].Expires = DateTime.Now.AddDays(-1);

                    Response.Redirect("CustomerViewCart.aspx");

                }
                else
                {
                    Response.Cookies[Session["EmailId"].ToString()].Value = null;

                    Response.Cookies[Session["EmailId"].ToString()].Value = copycart;

                    Response.Cookies[Session["EmailId"].ToString()].Expires = DateTime.Now.AddDays(1);

                    Response.Redirect("CustomerViewCart.aspx");
                }
                temp = 0;

            }
        }
    }
}