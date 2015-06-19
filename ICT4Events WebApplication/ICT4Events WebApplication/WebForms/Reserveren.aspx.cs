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
            //De aankomstdatum is de waarde uit de DateTimePicker
            DateTime aankomstDatum = Convert.ToDateTime(datepickerAankomstDatum.Value);
            DateTime vertrekDatum = Convert.ToDateTime(datepickerVertrekDatum.Value);
            //De vertrekdatum is de waarde uit de DateTimePicker
            string persoonID = tbPersoonID.Text;
            int kampeerplaatsNummer = Convert.ToInt32(tbkampeerplaats.Value);
            //Er wordt gecontroleerd of de kampeerplaats nog vrij is
            if (reserveringBeheer.CheckKampeerplaats(kampeerplaatsNummer) == null)
            {
                lblPlaatsBezet.Visible = false;
                //Er wordt geprobeerd om de reservering toe te voegen aan de database
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

        //Deze methode wordt aangeroepen als er een rij gekoppeld wordt aan de gridview. Hierdoor worden de rijen uit de gridview 'clickable'
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

        //Deze methode wordt aangeroepen als er een andere rij uit de gridview wordt geselecteerd. De waarde uit de eerste kolom van de geselecteerd rij wordt weergegeven in een textbox
        protected void gvGebruikers_SelectedIndexChanged(object sender, EventArgs e)
        {
            string persoonID = gvGebruikers.SelectedRow.Cells[0].Text;
            tbPersoonID.Text = persoonID;
        }

        //Deze methode wordt aangeroepen als er een rij gekoppeld wordt aan de gridview. Hierdoor worden de rijen uit de gridview 'clickable'
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

        //Deze methode wordt aangeroepen als er een andere rij uit de gridview wordt geselecteerd. De waarde uit de eerste kolom van de geselecteerd rij wordt weergegeven in een textbox
        protected void gvReserveringen_SelectedIndexChanged(object sender, EventArgs e)
        {
            string reserveringID = gvReserveringen.SelectedRow.Cells[0].Text;
            tbReserveringID.Text = reserveringID;
        }

        //Methode die wordt aangeroepen als er op de button 'Betaald' geklikt wordt
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