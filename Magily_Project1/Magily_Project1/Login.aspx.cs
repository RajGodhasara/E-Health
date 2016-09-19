using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Magily_Project1
{
    public partial class Login : System.Web.UI.Page
    {
        static string connection = @"Data Source=GOPIRAJ-PC;Initial Catalog=Magily;Integrated Security=True;Pooling=False";
        SqlConnection con = new SqlConnection(connection);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void Login1(object sender, EventArgs e)
        {
            string query = "select email from login where email='" + email.Text + "' and password='" + password.Text + "' ";
            SqlCommand cmd = new SqlCommand(query, con);
            DataTable dtFinal = new DataTable();
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            dtFinal.Load(cmd.ExecuteReader());
            int n = dtFinal.Rows.Count;
           
            if (n==0)
            {
                Response.Write("<script>alert('Login failed.')</script>");
            }
            else
            {
                Response.Write("<script>alert('Login successful.')</script>");
                Response.Redirect("~/LoginSuccess.aspx");
            }
        }

        protected void Registration(object sender, EventArgs e)
        {
            string query = "insert into Login values ('" + email.Text.Trim() + "','" + password.Text.Trim() + "')";
            SqlCommand cmd = new SqlCommand(query, con);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Thanks for registration.')</script>");
            email.Text = " ";
            password.Text = " ";
            con.Close();
        }
    }
}