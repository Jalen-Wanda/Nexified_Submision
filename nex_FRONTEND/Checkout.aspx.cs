using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampusBookMarket
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {

        }

        protected void btnCode_Click(object sender, EventArgs e)
        {
            if (txtPromo.Value.Trim() == "ABCD")
            {
                btnCode.Text = "Successfully added promo code";
            }else { 
                btnCode.Text = "INVALID promo code:(";
            }
        }
    }
}