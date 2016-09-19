using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Magily_Project1
{
    public partial class AngularJS_LoginApplication : System.Web.UI.Page
    {
        static string connection = @"Data Source=GOPIRAJ-PC;Initial Catalog=Magily;Integrated Security=True;Pooling=False";
        SqlConnection con = new SqlConnection(connection);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { //do something.
                DataTable dt = new DataTable();
               
                ViewState["dt"] = dt;

                //write the logic of autorefresh/



            }
        }
        // javascriptserialize = sjon;
        [System.Web.Services.WebMethod()]
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            
            string query = "select email from login where email='" + email.Text + "' and password='" + pass.Text + "' ";
            SqlCommand cmd = new SqlCommand(query, con);
            DataTable dtFinal = new DataTable();
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            dtFinal.Load(cmd.ExecuteReader());
            int n = dtFinal.Rows.Count;
            
            if (n == 0)
            {
                Response.Write("<script>alert('Login failed.')</script>");
            }
            else
            {
                Response.Write("<script>alert('Login successful.')</script>");
                Response.Redirect("~/LoginSuccess.aspx");
            }
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            //int i = 2;
            string query = "insert into Login values('" + email.Text + "' , '" + pass.Text + "')";
            SqlCommand cmd = new SqlCommand(query, con);
            
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            int n = cmd.ExecuteNonQuery();
            

            if (n == 0)
            {
                Response.Write("<script>alert('Register failed.')</script>");
            }
            else
            {
                Response.Write("<script>alert('Register successful.')</script>");
               // i++;
                
            }
        }
        [System.Web.Services.WebMethod()]
        protected void List_Click(object sender, EventArgs e)
        {
           
            DataSet ds = new DataSet();
            using (SqlConnection con1 = new SqlConnection(connection))
            {
                String query = "select * from login";
                SqlCommand cmd = new SqlCommand(query, con1);
                con1.Open();
               
                SqlDataAdapter da = new SqlDataAdapter(query, con1);
                da.Fill(ds);
                gv1.DataSource = ds;
                gv1.DataBind();
                con1.Close();
            }

           

        }

        protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt16(gv1.DataKeys[e.RowIndex].Values["id"].ToString());
            SqlCommand cmd = new SqlCommand("delete from Login where id=@idd",con);
            cmd.Parameters.AddWithValue("@idd", id);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

        }
        
        protected void gv1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           

                GridViewRow row = (GridViewRow)gv1.Rows[e.RowIndex];
                int id = Int32.Parse(gv1.DataKeys[e.RowIndex].Value.ToString());
                TextBox email = (TextBox)row.FindControl("t1");
                TextBox pass = (TextBox)row.FindControl("t2");


              

                 SqlCommand cmd = new SqlCommand("update Login set password='" + pass.Text + "',email='" + email.Text + "' where id=" + id + "", con);

                 con.Open();
                 int n= cmd.ExecuteNonQuery();
                  con.Close();
            if (n == 0)
            {
                Response.Write("<script>alert('Update failed.')</script>");
            }
            else
            {
                Response.Write("<script>alert('Update successful.')</script>");
                Response.Redirect("~/AngularJS-LoginApplication.aspx");

            }


        }
        protected void gv1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            
            gv1.EditIndex = e.NewEditIndex;

        }
    }
}