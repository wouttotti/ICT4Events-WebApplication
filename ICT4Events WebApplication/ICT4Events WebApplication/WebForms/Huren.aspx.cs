using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common.CommandTrees.ExpressionBuilder;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ICT4Events_WebApplication.Classes;
using CheckBox = System.Web.UI.WebControls.CheckBox;

namespace ICT4Events_WebApplication
{
    public partial class Huren : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        Database database = new Database();


        /// <summary>
        /// vult de listbox met alle exemplaren beschikbaar
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ListBox1.DataSource = AlleExemplaren();
                ListBox1.DataBind();
            }
        }

        /// <summary>
        /// vult een lijst met alle exemplaren uit de verhuurlijst
        /// vervolgens wordt er gekeken of het toegevoegde item al in de verhuurlijst staat 
        /// hierna wordt per exemplaar de borg bij elkaar opgeteld en weergeven in het label
        /// 
        /// </summary>
        protected void btnInfo_Click(object sender, EventArgs e)
        {
            List<string> lijstje = new List<string>();
            int totaleBorg = 0;

            foreach (ListItem item in lbHuurExemplaren.Items)
            {
                lijstje.Add(item.Text);
            }

            foreach (ListItem item in ListBox1.Items)
            {
                if (item.Selected)
                {
                    if (!lijstje.Contains(item.ToString()))
                    {
                        lbHuurExemplaren.Items.Add(item);
                        lijstje.Add(item.Text);
                    }
                    else
                    {
                        MessageBox.Show("Het item met het gekozen ID staat al in de lijst");
                    }
                }
            }
            List<string> geldLijstje = new List<string>();

            if (lbHuurExemplaren != null)
            {
                foreach (string s in lijstje)
                {
                    string ind = s.Substring(0, s.Length - 11);
                    ind = ind.Substring(ind.Length - 2, 2);
                    geldLijstje.Add(ind);
                }

                    foreach (string i in geldLijstje)
                    {
                        string y = i.Replace(" ", String.Empty);
                        totaleBorg += Convert.ToInt32(y);
                    }
                }

                lblBorg.Text = "\u20AC" + totaleBorg;
        }


        /// <summary>
        /// Gebruikt een SELECT statement om exemplaar en materiaal te koppelen.
        /// Vervolgens laat het het ExemplaarId, borg, de soort zien.
        /// </summary>
        public List<string> AlleExemplaren()
        {
            try
            {
                string query =
                    "select pe.id, \"naam\", \"merk\", \"prijs\", \"barcode\" from productcat pc, product p, productexemplaar pe where p.\"productcat_id\" = pc.id and p.id = pe.\"product_id\"";
                DataTable productList = database.voerQueryUit(query);
                List<string> stringList = new List<string>();
                foreach (DataRow dr in productList.Rows)
                {
                    stringList.Add(dr[0] + " - " + dr[1] + " - " + dr[2] + " - " + dr[3] + " - " + dr[4]);
                }
                return stringList;
            }
            catch (Exception)
            {
                MessageBox.Show("Er kon niets gevonden worden");
                return null;
            }
        }


        /// <summary>
        /// Haalt alle uitleningen uit de database en geeft hierbij het ID van 
        /// deze uitlening.
        /// </summary>
        public List<string> AlleUitleningen()
        {
            string query = "SELECT ID FROM \"VERHUUR\"";
            DataTable uitlening = database.voerQueryUit(query);
            List<string> stringList = new List<string>();
            foreach (DataRow dr in uitlening.Rows)
            {
                stringList.Add(dr[0] + "");
            }
            return stringList;
        }


        /// <summary>
        /// Gebruikt een SELECT statement om exemplaar en materiaal te koppelen.
        /// Vervolgens laat het het ExemplaarId, borg, de soort zien.
        /// De parameter is het Id van het exemplaar.
        /// </summary>
        public List<string> ZoekMateriaal(string id)
        {
            try
            {
                string query =
                    "select pe.id, \"naam\", \"merk\", \"prijs\", \"barcode\" from productcat pc, product p, productexemplaar pe " +
                    "where p.\"productcat_id\" = pc.id and p.id = pe.\"product_id\" and pe.id = " + id;
                DataTable materiaalZoeken = database.voerQueryUit(query);
                List<string> stringList = new List<string>();
                foreach (DataRow dr in materiaalZoeken.Rows)
                {
                    stringList.Add(dr[0] + " - " + dr[1] + " - " + dr[2] + " - " + dr[3] + " - " + dr[4]);
                }
                return stringList;
            }
            catch (Exception)
            {
                MessageBox.Show("Materiaal ID kon niet gevonden worden.");
                return null;
            }
        }


        /// <summary>
        /// Insert de verhuurquery met de bijbehorende kolommen in de database.
        /// </summary>
        public bool MateriaalHuren(int id, int exemplaarId, int pbId, DateTime uitleendatum, DateTime retourdatum, int prijs, int betaald)
        {
            try
            {
                string query =
                    "INSERT INTO \"VERHUUR\" (ID, \"productexemplaar_id\",\"res_pb_id\",\"datumIn\",\"datumUit\",\"prijs\",\"betaald\") VALUES (" + id + "," + exemplaarId + "," + pbId + ",To_date('" + uitleendatum.ToShortDateString() + "', 'DD/MM/YYYY'),To_date('" + retourdatum.ToShortDateString() + "', 'DD/MM/YYYY')," + prijs + "," + betaald + ")";
                database.Insert(query);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


        /// <summary>
        /// haalt de listbox met verhuurlijst leeg
        /// </summary>
        protected void btnWissen_Click(object sender, EventArgs e)
        {
            List<ListItem> geselecteerdeExemplaren = new List<ListItem>();

            foreach (ListItem li in lbHuurExemplaren.Items)
            {
                if (li.Selected)
                {
                    geselecteerdeExemplaren.Add(li);
                }
            }

            foreach (ListItem li in geselecteerdeExemplaren)
            {
                lbHuurExemplaren.Items.Remove(li);
            }
            
        }

        /// <summary>
        /// Zoekt m.b.v. de ZoekMateriaal methode naar het ingevoerde exemplaar ID
        /// </summary>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (tb.Text != "")
            {
                ListBox1.DataSource = ZoekMateriaal(tb.Text);
                ListBox1.DataBind();
            }
            else
            {
                ListBox1.DataSource = AlleExemplaren();
                ListBox1.DataBind();
            }
        }

        /// <summary>
        /// Kijkt naar het maximale verhuurid en voert een verhuring in in de database.
        /// Vervolgens wordt er gekeken naar de checkbox of er betaald is.
        /// voor elk item in de listbox. De datum is het moment dat er op de knop wordt gedrukt. 
        /// De retourdatum is drie dagen hierna.
        /// </summary>
        protected void btnUitlenen_Click(object sender, EventArgs e)
        {
            DateTime uitleenDatum = DateTime.Now;
            DateTime retourDatum = uitleenDatum.AddDays(3);

            int betaald = 0;

            if (cbBetaald.Checked)
            {
                betaald = 1;
            }

            int maxId = Convert.ToInt32(AlleUitleningen().Max());
            
                foreach (ListItem li in lbHuurExemplaren.Items)
                {
                    string id = li.Text.Substring(0, 1);

                    string prijs = li.Text.Substring(0, li.Text.Length - 11);
                    prijs = prijs.Substring(prijs.Length - 2, 2);
                    prijs = prijs.Replace(" ", String.Empty);
                    maxId += 1;
                    if (MateriaalHuren(maxId, Convert.ToInt32(id), 3, uitleenDatum, retourDatum, Convert.ToInt32(prijs), betaald))
                    {
                        
                        MessageBox.Show("Uitlening toegevoegd.");
                    }
                }
        }
    }
}