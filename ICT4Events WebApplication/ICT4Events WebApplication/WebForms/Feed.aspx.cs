using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICT4Events_WebApplication.Classes;
using System.Data;
namespace ICT4Events_WebApplication
{
    public partial class Feed : System.Web.UI.Page
    {
        private Database database;
        private DataTable datatable;
        private DataTable bijdrage_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            database = new Database();
            datatable = new DataTable();
            bijdrage_id = new DataTable();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Unnamed15_Click(object sender, EventArgs e)
        {

        }



        protected void rbBericht_CheckedChanged(object sender, EventArgs e)
        {
            if (rbBericht.Checked)
            {
                tbPad.Enabled = false;
            }
            if (rbBestand.Checked)
            {
                tbBericht.Enabled = false;
            }
            if (rbVideo.Checked)
            {
                tbBericht.Enabled = false;
            }
            if (rbFoto.Checked)
            {
                tbBericht.Enabled = false;
            }
            if (rbEvent.Checked)
            {
                tbPad.Enabled = false;
            }
        }

        protected void btPost_Click(object sender, EventArgs e)
        {

            string select2sql = "select \"ID\" from bijdrage";
            bijdrage_id = database.voerQueryUit(select2sql);
            int index = 2;
            foreach(DataRow d in bijdrage_id.Rows)
            {
                index++;
            }
            string insertsql = "INSERT INTO bijdrage(\"ID\", \"account_id\", \"datum\", \"soort\", \"like\", \"ongewenst\") VALUES(" + index + ", 4, SYSDATE, 'bericht', 0,0)";
            if(database.Insert(insertsql))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Het bericht is succesvol geplaats.');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Er is iets fout gegaan bij het inserten in bijdrage');", true);
            }
            string insert2sql = "INSERT INTO bericht(\"bijdrage_id\", \"titel\", \"inhoud\") VALUES (" + index + ", '" + tbTitel.Text + "', '" + tbBericht.Text + "')";
            if(database.Insert(insert2sql))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Het bericht is succesvol geplaats.');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Er is iets fout gegaan bij het bericht plaatsen.');", true);
            }
            string selectsql = "select \"bijdrage_id\" from bericht where \"titel\" = '" + tbTitel.Text + "' and \"inhoud\" = '" + tbBericht.Text + "'";
            datatable = database.voerQueryUit(selectsql);
            string insert3sql;
            insert3sql = "insert into account_bijdrage(\"ID\", \"account_id\", \"bijdrage_id\", \"like\", \"ongewenst\") values('', 4, " + index + ", 3, 4)";
        }


    }
}