using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using ICT4Events_WebApplication.Classes;
using System.Data;
using System.Windows.Forms;
using System.IO;
namespace ICT4Events_WebApplication
{
    public partial class Feed : System.Web.UI.Page
    {
        /// <summary>
        /// fields
        /// </summary>
        private Database database;
        private DataTable datatable;
        private DataTable bijdrage_id;
        private DataTable likes;
        /// <summary>
        /// deze code wordt uitgevoerd wanneer de pagina laadt
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            database = new Database();
            datatable = new DataTable();
            bijdrage_id = new DataTable();
        }
/// <summary>
/// deze code moet bepaalde velden op enabled of disabed zetten aan de hand van radiobuttons die gechecked zijn of niet.
/// </summary>
/// <param name="sender"></param>
/// <param name="e"></param>
        protected void rbBericht_CheckedChanged(object sender, EventArgs e)
        {
            if (rbBericht.Checked)
            {
                tbPad.Enabled = false;
            }
            if (rbBestand.Checked)
            {
                tbBericht.Enabled = false;
            }
            if (rbVideo.Checked)
            {
                tbBericht.Enabled = false;
            }
            if (rbFoto.Checked)
            {
                tbBericht.Enabled = false;
            }
            if (rbEvent.Checked)
            {
                tbPad.Enabled = false;
            }
        }
        /// <summary>
        /// dit event wordt uitgevoerd wanneer er op de postbutton wordt geklikt.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btPost_Click(object sender, EventArgs e)
        {

            string select2sql = "select \"ID\" from bijdrage";
            bijdrage_id = database.voerQueryUit(select2sql);
            int index = 2;
            foreach(DataRow d in bijdrage_id.Rows)
            {
                index++;
            }
            string insertsql = "INSERT INTO bijdrage(\"ID\", \"account_id\", \"datum\", \"soort\", \"like\", \"ongewenst\") VALUES(" + index + ", 4, SYSDATE, 'bericht', 0,0)";
            if (database.Insert(insertsql) == "True")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Het bericht is succesvol geplaats.');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Er is iets fout gegaan bij het inserten in bijdrage');", true);
            }
            string insert2sql = "INSERT INTO bericht(\"bijdrage_id\", \"titel\", \"inhoud\") VALUES (" + index + ", '" + tbTitel.Text + "', '" + tbBericht.Text + "')";
            if (database.Insert(insert2sql) == "True")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Het bericht is succesvol geplaats.');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Er is iets fout gegaan bij het bericht plaatsen.');", true);
            }
            string selectsql = "select \"bijdrage_id\" from bericht where \"titel\" = '" + tbTitel.Text + "' and \"inhoud\" = '" + tbBericht.Text + "'";
            datatable = database.voerQueryUit(selectsql);
            string insert3sql;
            insert3sql = "insert into account_bijdrage(\"ID\", \"account_id\", \"bijdrage_id\", \"like\", \"ongewenst\") values('', 4, " + index + ", 3, 4)";
            Response.Redirect("Feed.aspx");
        }
        /// <summary>
        /// hier wordt de selectedindex geselecteerd samen met protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }
        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string berichtID = GridView1.SelectedRow.Cells[1].Text;
            string berichttitel = GridView1.SelectedRow.Cells[0].Text;
            tbIdentificeer.Text = berichtID;
            lbidentificeer.Text = berichttitel;
        }

        /// <summary>
        /// deze code wordt uitgevoert wanneer er op de like button wordt geklikt
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void like_Click1(object sender, EventArgs e)
        {
            try
            {
                string liken = "select \"like\" from bijdrage where \"ID\" = " + Convert.ToInt32(tbIdentificeer.Text);
                likes = database.voerQueryUit(liken);
                string leuks = "";
                foreach(DataRow d in likes.Rows)
                {
                    leuks = d.ItemArray[0].ToString();
                }
                int vindikleuks = Convert.ToInt32(leuks);
                vindikleuks++;
                string insert = "Update bijdrage set \"like\" = "+ vindikleuks + " where  \"ID\" = " + Convert.ToInt32(tbIdentificeer.Text);
                if (database.Insert(insert) == "True")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('U heeft het bericht geliked');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Het is niet gelukt om het bericht te liken');", true);
                }
                Response.Redirect("Feed.aspx");
            }

            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Het is niet gelukt om het bericht te liken');", true);
            }

        }

        protected void download_Click(object sender, EventArgs e)
        {



            /*Ignore_________________________________________________________________________________________________*/
            /*OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Title = "Download een mediafile";
            openFileDialog.Filter =
                "jpg image (*.jpg)|*.jpg|jpeg image (*.jpeg)|*.jpeg|gif image (*.gif)|*.gif|png image (*.png)|*.png|wmv video (*.wmv)|*.wmv|mp4 video (*.mp4)|*.mp4|txt files (*.txt)|*.txt";
            openFileDialog.InitialDirectory = @"\\SRV2\";
            if (openFileDialog.ShowDialog() == DialogResult.OK & openFileDialog.FileName != "")
            {
                string bestandPath = openFileDialog.FileName;
                string bestandsnaam = openFileDialog.SafeFileName;
                if (DownloadenMedia(bestandPath, bestandsnaam))
                {
                    MessageBox.Show("Bestand is opgeslagen in: " + @"C:\Users\Public\ICT4Events");
                }
            }*/
        }
        /// <summary>
        /// hiermee is het mogelijk om een bestand te selecteren en up te loaden naar de server
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btBrowse_Click(object sender, EventArgs e)
        {
            /*
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter =
                "jpg image (*.jpg)|*.jpg|jpeg image (*.jpeg)|*.jpeg|gif image (*.gif)|*.gif|png image (*.png)|*.png|wmv video (*.wmv)|*.wmv|mp4 video (*.mp4)|*.mp4|txt files (*.txt)|*.txt";
            openFileDialog.Title = "Upload een mediafile";
            openFileDialog.RestoreDirectory = true;

            if (openFileDialog.ShowDialog() == DialogResult.OK & openFileDialog.FileName != "")
            {
                string bestandPath = openFileDialog.FileName;
                string extenion = Path.GetExtension(openFileDialog.FileName);
                string bestandsnaam = openFileDialog.SafeFileName;
                if (extenion.Equals(".jpg") || extenion.Equals(".JPG") || extenion.Equals(".jpeg") || extenion.Equals(".gif") || extenion.Equals(".png"))
                {
                    UploadenMedia(bestandPath, bestandsnaam, 1);
                    MessageBox.Show("Uw Afbeelding is succesvol geupload naar de server!");
                }
                if (extenion.Equals(".wmv") || extenion.Equals(".mp4"))
                {
                    UploadenMedia(bestandPath, bestandsnaam, 2);
                    MessageBox.Show("Uw Video is succesvol geupload naar de server!");
                }
                if (extenion.Equals(".txt"))
                {
                    UploadenMedia(bestandPath, bestandsnaam, 3);
                    MessageBox.Show("Uw Bestand is succesvol geupload naar de server!");
                }
            }*/
            if (FileUploadControl.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(FileUploadControl.FileName);
                    FileUploadControl.SaveAs(Server.MapPath("~/") + filename);
                    string serverpad = @"\\SRV2\bestanden\";
                    tbPad.Text = serverpad + filename;

                    string select2sql = "select \"ID\" from bijdrage";
                    bijdrage_id = database.voerQueryUit(select2sql);
                    int index = 2;
                    foreach(DataRow d in bijdrage_id.Rows)
                    {
                        index++;
                    }
                    string insert = "INSERT INTO bijdrage(\"ID\", \"account_id\", \"datum\", \"soort\", \"like\", \"ongewenst\") VALUES(" + index + ", 4, SYSDATE, 'bericht', 0,0)";

                    if(database.Insert(insert) == "True")
                    {
                        string inserten = "INSERT INTO bestand(\"bijdrage_id\", \"categorie_id\", \"bestandslocatie\", \"grootte\") VALUES(" + index + ", 1, '"+ tbPad.Text +"' , 30)";
                        if (database.Insert(inserten) == "True")
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Het bericht is succesvol geplaats.');", true);
                        }
                        
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Het bericht is niet geplaatst, probeer het opnieuw.');", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Het bericht is niet geplaatst, probeer het opnieuw.');", true);
                    }




                    
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
        /// <summary>
        /// Code voor het downloaden van media vanaf de server
        /// </summary>
        /// <param name="bronFile">pad naar het bestand</param>
        /// <param name="bestandsnaam">naam van het bestand</param>
        /// <returns></returns>
        public bool DownloadenMedia(string bronFile, string bestandsnaam)
        {
            //Code voor het downloaden van media vanaf de server
            string doelPath = @"C:\Users\Public\ICT4Events";
            string doelBestand = Path.Combine(doelPath, bestandsnaam);
            if (!Directory.Exists(doelPath))
            {
                Directory.CreateDirectory(doelPath);
            }
            try
            {
                File.Copy(bronFile, doelBestand, true);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        /// <summary>
        /// Code voor het uploaden van media naar de server
        /// </summary>
        /// <param name="bronPath">pad naar het bestand</param>
        /// <param name="bestandsnaam">naam van het bestand</param>
        /// <param name="type">extensie van het bestand</param>
        public void UploadenMedia(string bronPath, string bestandsnaam, int type)
        {
            //Code voor het uploaden van media naar de server
            switch (type)
            {
                case 1:
                    File.Copy(bronPath, @"\\SRV2\Foto\" + bestandsnaam);
                    break;
                case 2:
                    File.Copy(bronPath, @"\\SRV2\Video\" + bestandsnaam);
                    break;
                case 3:
                    File.Copy(bronPath, @"\\SRV2\Bestanden\" + bestandsnaam);
                    break;
            }
        }

        



    }
}