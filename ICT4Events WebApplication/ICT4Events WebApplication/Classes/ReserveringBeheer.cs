using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ICT4Events_WebApplication.Classes
{
    using System.Data;
    using System.Windows.Forms;

    public class ReserveringBeheer
    {
        private static Database database = new Database();

        public bool Reserveren(string persoonID, DateTime aankomstDatum, DateTime vertrekDatum, string betaald)
        {
            try
            {
                string query =
                    @"INSERT INTO RESERVERING(""persoon_id"",""datumStart"",""datumEinde"",""betaald"")VALUES('"
                    + persoonID + "', TO_DATE('" + aankomstDatum + "','DD/MM/YYYY HH24:MI:SS'),TO_DATE('" + vertrekDatum
                    + "','DD/MM/YYYY HH24:MI:SS'),'0')";
                database.Insert(query);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public string VindReserveringNummer(string persoonID, DateTime aankomstDatum, DateTime vertrekDatum)
        {
            try
            {
                string query = @"SELECT id FROM Reservering WHERE ""persoon_id"" = " + persoonID
                               + "AND \"datumStart\" = TO_DATE('" + aankomstDatum
                               + "', 'DD/MM/YYYY HH24:MI:SS') AND \"datumEinde\" = TO_DATE('" + vertrekDatum
                               + "', 'DD/MM/YYYY HH24:MI:SS')";
                DataTable reserveringen = database.voerQueryUit(query);
                string[] array = new string[1];
                foreach (DataRow dr in reserveringen.Rows)
                {
                    array[0] = dr[0].ToString();
                }
                string reserveringNummer = array.GetValue(0).ToString();
                return reserveringNummer;

            }
            catch (Exception)
            {
                MessageBox.Show("Reserveringsnummer kan niet worden gevonden.");
                return null;
            }
        }

        public bool KoppelKampeerplaats(string reserveringID, string kampeerplaatsnummer)
        {
            try
            {
                string queryInsert =
                    @"INSERT INTO PLEK_RESERVERING(""plek_id"",""reservering_id"")VALUES('"
                    + kampeerplaatsnummer + "','" + reserveringID + "')";
                database.Insert(queryInsert);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public string VindKampeerplaatsID(int kampeerPlaatsnummer)
        {
            try
            {
                string query = @"SELECT id FROM Plek WHERE ""nummer"" = '" + kampeerPlaatsnummer + "'";
                DataTable reserveringen = database.voerQueryUit(query);
                string[] array = new string[1];
                foreach (DataRow dr in reserveringen.Rows)
                {
                    array[0] = dr[0].ToString();
                }
                string kampeerplaatsID = array.GetValue(0).ToString();
                return kampeerplaatsID;

            }
            catch (Exception)
            {
                MessageBox.Show("KampeerplaatsID kan niet worden gevonden.");
                return null;
            }
        }

        public bool UpdateBetaling(int reserveringNummer)
        {
            try
            {
                string queryInsert =
                    "UPDATE Reservering SET \"Betaald\" + = '1' WHERE \"id\"= '" + reserveringNummer + "'";
                database.Insert(queryInsert);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public string CheckKampeerplaats(int plaatsnummer)
        {
            try
            {
                string query = "SELECT id FROM plek_reservering WHERE \"plek_id\"= '" + plaatsnummer + "'";
                DataTable plekReserveringID = database.voerQueryUit(query);
                string[] array = new string[1];
                foreach (DataRow dr in plekReserveringID.Rows)
                {
                    array[0] = dr[0].ToString();
                }
                string plekID = array.GetValue(0).ToString();
                return plekID;

            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}