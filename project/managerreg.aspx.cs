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
    public partial class mangerreg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void reg_Click(object sender, EventArgs e)
        {
            string id1 = loginid.Text;
            string p = password.Text;
            //string name = fristname.Text + lastname.Text;
            string fn1 = fristname.Text, ln1 = lastname.Text, rol = "Manager", qulif = "";
            string g = "";
            if (male.Checked == true)
                g = "Male";
            else if (female.Checked == true)
                g = "Female";
            int ag1 = int.Parse(age.Text);

            if (ug.Checked == true)
                qulif = qulif + "Ug";
            if (pg.Checked)
                qulif = qulif + "pg";
            string dep = dept.SelectedItem.Text;
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
            con.Open();
            string s1 = "call sp_mng_projectinfo('" + id1 + "','" + fn1 + "','" + ln1 + "','" + g + "','" + ag1 + "','" + p + "','" + rol + "','" + qulif + "','" + dep + "');";
            MySqlCommand cmd = new MySqlCommand(s1, con);
            int n1 = cmd.ExecuteNonQuery();
            if (n1 == 1)
            {
                Label1.Visible = true;
                Label1.Text = "record inserted successfilly";
                
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "record not inserted ";
            }
            con.Close();
           
        }
    }
}