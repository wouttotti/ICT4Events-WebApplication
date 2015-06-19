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

        /// <summary>
        /// Deze methode voert een query uit die er voor zorgt dat er een reservering aangemaakt wordt in de database
        /// </summary>
        /// <param name="persoonID">Het ID van de hoofdboeker, die opgeslagen is in de tabel persoon</param>
        /// <param name="aankomstDatum">De datum waarop de hoofdboeker aankomt</param>
        /// <param name="vertrekDatum">De dattum waarop de hoofdboeker vertrekt</param>
        /// <param name="betaald">Een check om te kijken of de reservering betaald is, in het begin is dit altijd 0</param>
        /// <returns>True als query met succes is uitgevoerd</returns>
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

        /// <summary>
        /// Deze methode voert een query uit die er voor zorgt dat er een reserveringnummer wordt opgezocht in de database
        /// </summary>
        /// <param name="persoonID">Het ID van de hoofdboeker, die opgeslagen is in de tabel persoon</param>
        /// <param name="aankomstDatum">De datum waarop de hoofdboeker aankomt</param>
        /// <param name="vertrekDatum">De dattum waarop de hoofdboeker vertrekt</param>
        /// <returns>True als query met succes is uitgevoerd</returns>
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

        /// <summary>
        /// Deze methode voert een query uit die er voor zorgt dat er een reservering wordt gekoppeld aan de kampeerplaats
        /// </summary>
        /// <param name="reserveringID">Het ID van de reservering</param>
        /// <param name="kampeerplaatsnummer">Het nummer van de kampeerplaats</param>
        /// <returns>True als query met succes is uitgevoerd</returns>
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

        /// <summary>
        /// Deze methode voert een query uit die er voor zorgt dat het ID van de kampeerplaats wordt opgezocht
        /// </summary>
        /// <param name="kampeerPlaatsnummer">Het nummer van de kampeerplaats</param>
        /// <returns>True als query met succes is uitgevoerd</returns>
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

        /// <summary>
        /// Deze methode voert een query uit die er voor zorgt dat de betaling up to date gebracht wordt
        /// </summary>
        /// <param name="reserveringNummer">Het nummer van de reservering</param>
        /// <returns>True als query met succes is uitgevoerd</returns>
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

        /// <summary>
        /// Deze methode voert een query uit, deze query checkt of het ID van de kampeerplaats voorkomt in de tabel plek_reservering
        /// </summary>
        /// <param name="plaatsnummer"></param>
        /// <returns></returns>
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