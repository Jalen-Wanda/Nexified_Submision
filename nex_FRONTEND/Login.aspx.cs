using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HashPass;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Service1Client service = new Service1Client();
            int response = 0;
            response = service.Login(reg_email.Value, Secrecy.HashPassword(password.Value));

            //user exist
            if (response == 1)
            {
                // ✅ Set session variables
               
                Session["UserEmail"] = reg_email.Value;
                Session["UserPassword"] = Secrecy.HashPassword(password.Value);
                
                Response.Redirect("User_index.aspx");
                
            

            }
            //user doesnt exist yet
            else if (response == 0)
            {
                Response.Redirect("Register.aspx");

            }
            else
            {
                lblResponse.Visible = true;
                lblResponse.Text = "System Errors..";
                lblResponse.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}