﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

namespace ICT4Events_WebApplication.Classes
{
    using System.Data;
    using System.Windows.Forms;

    internal class Database
    {
        private OracleConnection connection;

        private String connectionString = "User Id=system;Password=P@ssw0rd;Data Source=//192.168.20.71/xe;";

        //Deze methode opent de connectie met de database aan het hand van de gegevens in de connectionString
        public void openConnection()
        {
            connection = new OracleConnection();
            connection.ConnectionString = connectionString;
            try
            {
                connection.Open();
            }
            catch (OracleException exc)
            {
                MessageBox.Show(exc.Message);
            }
            
        }

        //Er wordt een query uitgevoert en de data wordt opgeslagen in een datatable
        public DataTable voerQueryUit(String query)
        {
            openConnection();
            OracleCommand command = new OracleCommand(query, connection);
            try
            {
                OracleDataReader reader = command.ExecuteReader();
                DataTable dataTable = new DataTable();
                dataTable.Load(reader);
                return dataTable;
            }
            catch (OracleException exc)
            {
                MessageBox.Show(exc.Message);
            }
            finally
            {
                connection.Close();
                command.Dispose();
            }
            return null;
        }

        //Er wordt een insert query gedaan in de database
        public string Insert(string sql)
        {
            try
            {
                openConnection();
                OracleDataAdapter DataAdapter = new OracleDataAdapter(sql, connection);
                DataSet Data = new DataSet();
                DataAdapter.Fill(Data);
                return "True";
            }
            catch (OracleException)
            {
                return "Unique";
            }
            finally
            {
                connection.Close();
            }
        }

        public string ExecuteProcedure(string email, string naam, string wachtwoord, string admin)
        {   
            using(OracleConnection objConn = new OracleConnection("User Id=system;Password=P@ssw0rd;Data Source=//192.168.20.71/xe;"))
            {
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = objConn;
                cmd.Parameters.Add("v_gebruikersnaam", OracleDbType.Varchar2).Value = naam;
                cmd.Parameters.Add("v_email", OracleDbType.Varchar2).Value = email;
                cmd.Parameters.Add("v_wachtwoord", OracleDbType.Varchar2).Value = wachtwoord;
                cmd.Parameters.Add("v_admin", OracleDbType.Varchar2).Value = admin;
                cmd = new OracleCommand("ACCOUNTAANMAKEN", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    objConn.Open();
                    cmd.ExecuteNonQuery();

                    return "true";
                }
                catch(OracleException)
                {
                    return "Unique";    
                }
                finally
                {
                    objConn.Close();
                }
            }
            
        }

        public bool Update(string selectSql, string updateSql)
        {
            try
            {
                openConnection();
                OracleDataAdapter DataAdapter = new OracleDataAdapter(selectSql, connection);
                DataAdapter.UpdateCommand = new OracleCommand(updateSql, connection);
                DataSet Data = new DataSet();
                DataAdapter.Fill(Data);
                DataAdapter.Update(Data);
                return true;
            }
            catch (OracleException exc)
            {
                MessageBox.Show(exc.Message);
                return false;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}