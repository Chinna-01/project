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
    public partial class reg : System.Web.UI.Page
    {
        private void mnglist()
        {
            manager1.Items.Insert(0, "--select--");
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
            con.Open();
            string s = "select fristname,lastname from tblprojectinfo where emprole='manager' ";
            MySqlCommand cmd = new MySqlCommand(s, con);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    manager1.Items.Add(dr[0].ToString() + " " + dr[1].ToString());
                }
            }
            con.Close();
        }
        private void tllist()
        {
            teamleader1.Items.Insert(0, "--select--");
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
            con.Open();
            string s = "select fristname,lastname from tblprojectinfo where emprole='team leader' ";
            MySqlCommand cmd = new MySqlCommand(s, con);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    teamleader1.Items.Add(dr[0].ToString() + " " + dr[1].ToString());
                }
            }
            con.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            mnglist();
            tllist();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string id1 = loginid.Text;
            string p = password.Text;
            //string name = fristname.Text + lastname.Text;
            string fn1 = fristname.Text, ln1 = lastname.Text, rol = "employee", qulif = "";
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
            string mng = manager1.SelectedItem.Text;
            string tl = teamleader1.SelectedItem.Text;
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
            con.Open();
            string s1 = "call sp_emp_projectinfo('" + id1 + "','" + fn1 + "','" + ln1 + "','" + g + "','" + ag1 + "','" + p + "','" + rol + "','" + qulif + "','" + dep + "','" + mng + "','" + tl + "');";
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