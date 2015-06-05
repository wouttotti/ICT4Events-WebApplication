using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICT4Events_WebApplication
{
    public partial class Huren : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnInfo_Click(object sender, EventArgs e)
        {
           string script = "<script type=\"text/javascript\">" +
                           "alert('1. Selecteer in de linker checklistbox het materiaal " +
                           "dat verhuurd gaat worden. 2. Onder deze listbox kan ook gezocht" +
                           " worden naar het materiaal ID. Klik vervolgens op uitlenen om " +
                           "de exemplaren in de rechter listbox toe te wijzen aan een persoon.');" +
                           "</script>";
           ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        }
    }
}