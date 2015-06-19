using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace ICT4Events_WebApplication.Classes
{
    public class Gebruikerbeheer
    {
        private Database database = new Database();

        public string GebruikerToevoegen(string email, string naam, string wachtwoord, int admin)
        {
            string adminCheck = Convert.ToString(admin);
            string Return = database.ExecuteProcedure(email, naam, wachtwoord, adminCheck);
           
            return Return;
        }
        public DataTable LijstAanwezigen(bool aanwezig)
        {
            string sql;
            if (aanwezig == true)
            {
                sql = @"SELECT * FROM ACCOUNT WHERE ""geactiveerd"" = 1";
            }
            else
            {
                sql = @"SELECT * FROM ACCOUNT WHERE ""geactiveerd"" = 0";
            }

            DataTable dt = database.voerQueryUit(sql);
            return dt;
        }
        public bool inloggen(string Email, string Wachtwoord)
        {
            DataTable dt = new DataTable();
            string sql = @"SELECT ""email"", ""wachtwoord"" FROM ACCOUNT";
            dt = database.voerQueryUit(sql);
            if(Email == "")
            {
                throw new NoDataException("Vul een email in.");
            }
            else if(Wachtwoord == "")
            {
                throw new NoDataException("Vul een wachtwoord in.");
            }
            else
            {
                
                if(dt.Rows.Count != 0)
                {
                    foreach(DataRow temp in dt.Rows)
                    {
                        if(temp["email"].ToString() == Email)
                        {
                            if(temp["wachtwoord"].ToString() == Wachtwoord)
                            {
                                return true;
                            }
                            else
                            {
                                throw new NoDataException("Wachtwoord klopt niet.");
                            }
                        }
                    }
                }
                throw new NoDataException("Gebruikersnaam bestaat niet.");
            }
        }
        public bool Aanwezig(string barcode)
        {
            DataTable dt = new DataTable();
            string sql = @"SELECT * FROM ACCOUNT WHERE ""barcodeID"" = '" + barcode + "'";
            dt = database.voerQueryUit(sql);
            if(dt.Rows.Count == 0)
            {
                return false;
            }
            else
            {
                foreach(DataRow temp in dt.Rows)
                {
                    if(Convert.ToInt32(temp["geactiveerd"].ToString()) == 1)
                    {
                        string sqlUpdate = @"UPDATE ACCOUNT SET ""geactiveerd"" = 0 WHERE ""barcodeID"" = '" + barcode + "'";
                        database.Insert(sqlUpdate);
                        return true;
                    }
                    else
                    {
                        string sqlUpdate = @"UPDATE ACCOUNT SET ""geactiveerd"" = 1 WHERE ""barcodeID"" = '" + barcode + "'";
                        database.Insert(sqlUpdate);
                        return true;
                    }
                }
            }
            return false;
        }
    }
}