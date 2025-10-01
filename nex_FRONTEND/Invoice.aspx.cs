using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    public partial class invoice : System.Web.UI.Page
    {

        

        public string InvoiceNumber = "INV-044";
        //public String datett = DateTime;
        public  DateTime now = DateTime.Now;

        Service1Client service = new Service1Client();


        protected void Page_Load(object sender, EventArgs e)
        {


        }
    }
}