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
            string sql = @"INSERT INTO ACCOUNT(""gebruikersnaam"", ""email"", ""wachtwoord"", ""admin"", ""activatiehash"", ""geactiveerd"") VALUES('" + naam + "', '" + email + "', '" + wachtwoord + "', '" + admin + "', 0, 0)";
            string Return = database.Insert(sql);
           
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
    }
}