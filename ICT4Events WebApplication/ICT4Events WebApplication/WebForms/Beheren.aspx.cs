﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using ICT4Events_WebApplication.Classes;

namespace ICT4Events_WebApplication
{
    using System.Data;

    public partial class Beheren : System.Web.UI.Page
    {
        private Gebruikerbeheer gebruikerbeheer = new Gebruikerbeheer();
        protected void Page_Load(object sender, EventArgs e)
        {
            LbError.Visible = false;
        }

        protected void btnAanmaken_Click(object sender, EventArgs e)
        {
            
            if(tbGebruikersnaam.Text == "" || tbNaam.Text =="" || tbWachtwoord.Text == "")
            {
                LbError.Text = "Vul geldige informatie in.";
                LbError.ForeColor = System.Drawing.Color.Red;
                LbError.Visible = true;
            }
            else if (cbAdmin.Checked == true)
            {
                if (gebruikerbeheer.GebruikerToevoegen(tbGebruikersnaam.Text, tbNaam.Text, tbWachtwoord.Text, 1) == "Unique")
                {
                    LbError.Text = "Gebruiker bestaat al.";
                    LbError.ForeColor = System.Drawing.Color.Red;
                    LbError.Visible = true;
                }
                else
                {
                    LbError.Text = "Gebruiker is toegevoegd.";
                    LbError.ForeColor = System.Drawing.Color.Green;
                    LbError.Visible = true;
                }
            }
            else
            {
                if (gebruikerbeheer.GebruikerToevoegen(tbGebruikersnaam.Text, tbNaam.Text, tbWachtwoord.Text, 0) == "Unique")
                {
                    LbError.Text = "Gebruiker bestaat al.";
                    LbError.ForeColor = System.Drawing.Color.Red;
                    LbError.Visible = true;
                }
                else
                {
                    LbError.Text = "Gebruiker is toegevoegd.";
                    LbError.ForeColor = System.Drawing.Color.Green;
                    LbError.Visible = true;
                }
            }
        }

        protected void btnLaatzien_Click(object sender, EventArgs e)
        {
            RefreshListBox();
        }

        private void RefreshListBox()
        {
            ListBGebruikers.Items.Clear();
            DataTable dt = new DataTable();
            if (cbAanwezig.Checked == true)
            {
                dt = gebruikerbeheer.LijstAanwezigen(true);
            }
            else
            {
                dt = gebruikerbeheer.LijstAanwezigen(false);
            }
            foreach (DataRow temp in dt.Rows)
            {
                string RowItem = temp["ID"].ToString() + ", " + temp["gebruikersnaam"].ToString() + ", "
                                 + temp["email"].ToString();
                ListBGebruikers.Items.Add(RowItem);
            }
        }

        protected void tbBarcode_TextChanged(object sender, EventArgs e)
        {
            if(TbBarcode.Text != "")
            {
                if(gebruikerbeheer.Aanwezig(TbBarcode.Text) == true)
                {
                    pnStatus.Visible = true;
                    pnStatus.ControlStyle.BackColor = System.Drawing.Color.Green;
                    TimerPanelReset.Enabled = true;
                }
                else
                {
                    pnStatus.Visible = true;
                    pnStatus.ControlStyle.BackColor = System.Drawing.Color.Red;
                    TimerPanelReset.Enabled = true;
                }
            }
            RefreshListBox();
        }

        protected void TimerPanelReset_Tick(object sender, EventArgs e)
        {
            TbBarcode.Text = "";
            pnStatus.ControlStyle.BackColor = ColorTranslator.FromHtml("#efeeef");
            TimerPanelReset.Enabled = false;
        }

    }
}