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
    public partial class info : System.Web.UI.Page
    {
        protected void getdata()
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
            con.Open();
            string q = "select * from tblprojectinfo";
            MySqlCommand cmd = new MySqlCommand(q,con);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataSet dt = new DataSet();
            da.Fill(dt);
            cmd.ExecuteReader();
            information.DataSource = dt;
            information.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getdata();
        }
    }
}