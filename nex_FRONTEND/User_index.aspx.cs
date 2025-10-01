using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampusBookMarket
{
    public partial class User_index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var master = (Main)this.Master;
                master.LoginButton.Visible = false;
                master.RegisterButton.Visible = false;
            }
        }

    }
}