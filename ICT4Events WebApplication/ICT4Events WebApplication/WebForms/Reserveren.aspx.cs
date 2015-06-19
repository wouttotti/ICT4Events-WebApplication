using System;
using System.Web.UI.WebControls;

using ICT4Events_WebApplication.Classes;

namespace ICT4Events_WebApplication
{
    using System.Windows.Forms;

    public partial class Reserveren : System.Web.UI.Page
    {
        private ReserveringBeheer reserveringBeheer = new ReserveringBeheer();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblPlaatsBezet.Visible = false;
        }

        protected void btnReserveren_Click(object sender, EventArgs e)
        {
            DateTime aankomstDatum = Convert.ToDateTime(datepickerAankomstDatum.Value);
            //de aankomstdatum is de waarde uit de DateTimePicker
            DateTime vertrekDatum = Convert.ToDateTime(datepickerVertrekDatum.Value);
            //de vertrekdatum is de waarde uit de DateTimePicker
            string persoonID = tbPersoonID.Text;
            int kampeerplaatsNummer = Convert.ToInt32(tbkampeerplaats.Value);
            if (reserveringBeheer.CheckKampeerplaats(kampeerplaatsNummer) == null)
            {
                lblPlaatsBezet.Visible = false;
                if (reserveringBeheer.Reserveren(persoonID, aankomstDatum, vertrekDatum, "0"))
                {
                    MessageBox.Show("Reservering Toegevoegd!");
                }
                string reserveringNummer = reserveringBeheer.VindReserveringNummer(persoonID, aankomstDatum, vertrekDatum);
                string kampeerplaatsID = reserveringBeheer.VindKampeerplaatsID(kampeerplaatsNummer);
                if (reserveringBeheer.KoppelKampeerplaats(reserveringNummer, kampeerplaatsID))
                {
                    MessageBox.Show("Kampeerplaats gekoppeld");
                }
            }
            else
            {
                lblPlaatsBezet.Visible = true;
            }
        }

        protected void gvGebruikers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(
                    gvGebruikers,
                    "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void gvGebruikers_SelectedIndexChanged(object sender, EventArgs e)
        {
            string persoonID = gvGebruikers.SelectedRow.Cells[0].Text;
            tbPersoonID.Text = persoonID;
        }

        protected void gvReserveringen_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(
                    gvReserveringen,
                    "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void gvReserveringen_SelectedIndexChanged(object sender, EventArgs e)
        {
            string reserveringID = gvReserveringen.SelectedRow.Cells[0].Text;
            tbReserveringID.Text = reserveringID;
        }

        protected void btnBetaald_Click(object sender, EventArgs e)
        {
            int reserveringID = Convert.ToInt32(tbReserveringID.Text);
            //In de database wordt de betaling bijgewerkt aan de hand van het reserveringsnummer
            if (reserveringBeheer.UpdateBetaling(reserveringID))
            {
                MessageBox.Show("Reservering: " + reserveringID + " is betaald");
            }
            else
            {
                MessageBox.Show("Betaling kan niet worden gewijzigd");
            }
        }
    }
}