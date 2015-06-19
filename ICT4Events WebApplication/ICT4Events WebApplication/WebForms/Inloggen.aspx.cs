using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICT4Events_WebApplication.Classes;

namespace ICT4Events_WebApplication
{

    public partial class Inloggen : System.Web.UI.Page
    {
        Gebruikerbeheer gebruikerbeheer = new Gebruikerbeheer();
        protected void Page_Load(object sender, EventArgs e)
        {
            LbError.Visible = false;
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                gebruikerbeheer.inloggen(TbGebruikersnaam.Text, TbWachtwoord.Text);
                Session["EMAIL"] = TbGebruikersnaam.Text;
                Response.Redirect("Home.aspx");
            }
            catch (NoDataException ex)
            {
                LbError.Text = ex.Message;
                LbError.ForeColor = System.Drawing.Color.Red;
                LbError.Visible = true;
            }
        }
    }
}