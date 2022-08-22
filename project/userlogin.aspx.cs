using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace project
{
    public partial class userlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_Click(object sender, EventArgs e)
        {
            string uid = userid.Text;
            string pw = password.Text;
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
            con.Open();
            string q = "call sp_login('"+uid+"','"+pw+"')";
            MySqlCommand cmd = new MySqlCommand(q, con);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmd.ExecuteReader();

            if (dt.Rows.Count > 0)
            {
                Session["role"] = dt.Rows[0]["emprole"].ToString();
                Session["name"]= dt.Rows[0]["fristname"].ToString()+" "+ dt.Rows[0]["lastname"];
                Response.Redirect("welcome.aspx");
            }
            else
            {
                result.Visible = true;
                result.Text = "failed";
            }
           
        }

       
    }
}