using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ICT4Events_WebApplication.Classes;

namespace ICT4Events_WebApplication
{
    using System.Windows.Forms;

    using TextBox = System.Web.UI.WebControls.TextBox;

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
            int kampeerplaatsNummer = 200;
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
    }
}