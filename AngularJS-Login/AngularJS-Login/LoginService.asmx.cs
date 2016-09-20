using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace AngularJS_Login.Scripts
{
    /// <summary>
    /// Summary description for LoginService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class LoginService : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void Insert(string Email, string Pass)
        {
            string ret;
            string connection = @"Data Source=GOPIRAJ-PC;Initial Catalog=Magily;Integrated Security=True;Pooling=False";
            SqlConnection con = new SqlConnection(connection);
            string query = "insert into login values (@email,@pass) ";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@email", Email);
            cmd.Parameters.AddWithValue("@pass", Pass);
           // DataTable dtFinal = new DataTable();
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            //dtFinal.Load(cmd.ExecuteReader());
            int n = cmd.ExecuteNonQuery();

            if (n == 0)
            {

                ret = "error while inserting.";
            }
            else
            {
                ret = "data inserted Successfully";
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(ret));


        }


        [WebMethod]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void Authentication(string email, string pass)
        {
            string ret;
            string connection = @"Data Source=GOPIRAJ-PC;Initial Catalog=Magily;Integrated Security=True;Pooling=False";
            SqlConnection con = new SqlConnection(connection);
            string query = "select email from login where email=@email and password=@pass ";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@pass", pass);
            DataTable dtFinal = new DataTable();
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            dtFinal.Load(cmd.ExecuteReader());
            int n = dtFinal.Rows.Count;

            if (n == 0)
            {

                ret = "login Failed.";
            }
            else
            {
                ret = "Login Successful";
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(ret));


        }
        [WebMethod]
        public void list()
        {
            string connection = @"Data Source=GOPIRAJ-PC;Initial Catalog=Magily;Integrated Security=True;Pooling=False";
            List<LoginModule> listlogin = new List<LoginModule>();
            using (SqlConnection con1 = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand("select * from login", con1);
                con1.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    LoginModule lm = new LoginModule();
                    lm.email = rdr["email"].ToString();
                    lm.pass = rdr["password"].ToString();
                    listlogin.Add(lm);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(listlogin));
        }

        [WebMethod]
        public DataTable Get()
        {
            string connection = @"Data Source=GOPIRAJ-PC;Initial Catalog=Magily;Integrated Security=True;Pooling=False";
            using (SqlConnection con = new SqlConnection(connection))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM login"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            dt.TableName = "login";
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }


    }
}
