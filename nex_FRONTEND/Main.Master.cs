using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    
    public partial class Main : System.Web.UI.MasterPage
    {
        Service1Client Serv = new Service1Client();
        bool trylogin = true;
        bool tryReg = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cartCount.InnerText = "0"; // set initial value
            }
            if (Session["UserEmail"] != null) // ✅ user is logged in
            {
                loginBtn.Visible = false;
                registerBtn.Visible = false;
                dynamic cart = Serv.GetUserCart(Convert.ToInt32(Session["Userid"]));
                int Counter = 0;
                foreach(ServiceReference1.Cart Item in cart)
                {
                    Counter += 1;

                }
                cartCount.InnerText = Convert.ToString(Counter);
            }
            else
            {
                loginBtn.Visible = true;
                registerBtn.Visible = true;
            }
        }


        public Button LoginButton
        {
            get { return loginBtn; }
        }

        public Button RegisterButton
        {
            get { return registerBtn; }
        }
        protected void loginBtn_Click(object sender, EventArgs e)
        {

            Response.Redirect("login.aspx");
            
        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {

           Response.Redirect("Register.aspx");
        }

       
    }
}