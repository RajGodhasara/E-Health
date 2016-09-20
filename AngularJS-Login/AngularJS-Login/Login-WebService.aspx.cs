using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AngularJS_Login.Scripts
{
    public partial class Login_WebService1 : System.Web.UI.Page
    {
        static string connection = @"Data Source=GOPIRAJ-PC;Initial Catalog=Magily;Integrated Security=True;Pooling=False";
        SqlConnection con = new SqlConnection(connection);
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();

            ViewState["dt"] = dt;
        }

        protected void list_using_grid(object sender, EventArgs e)
        {
            LoginService service = new LoginService();
            gv1.DataSource = service.Get();
            gv1.DataBind();
        }
        protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt16(gv1.DataKeys[e.RowIndex].Values["id"].ToString());
            SqlCommand cmd = new SqlCommand("delete from Login where id=@idd", con);
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
            int n = cmd.ExecuteNonQuery();
            con.Close();
            if (n == 0)
            {
                Response.Write("<script>alert('Update failed.')</script>");
            }
            else
            {
                Response.Write("<script>alert('Update successful.')</script>");
                Response.Redirect("~/Login-WebService.aspx");

            }


        }
        protected void gv1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            gv1.EditIndex = e.NewEditIndex;

        }
    }
}