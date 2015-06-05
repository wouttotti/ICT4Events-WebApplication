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
            if (IsPostBack)
            {
                const string script = "<script type=\"text/javascript\">alert('Selecteer in de linker listbox het materiaal dat verhuurd gaat worden. Klik vervolgens op uitlenen om de exemplaren toe te wijzen.');</script>";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
            }
        }

        protected void btnInfo_Click(object sender, EventArgs e)
        {
            
           string script = "<script type=\"text/javascript\">alert('Selecteer in de linker listbox het materiaal dat verhuurd gaat worden. Klik vervolgens op uitlenen om de exemplaren toe te wijzen.');</script>";
           ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        }
    }
}