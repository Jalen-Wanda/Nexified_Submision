using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Service1Client service = new Service1Client();
            if (Session["UserEmail"] == null)
            {
                // Not logged in
                Response.Redirect("Login.aspx");
            }
            else
            {
                // Logged in: use session variables
                
                string email = Session["UserEmail"].ToString();
                string password = Session["UserPassword"].ToString();
                string inHTML = "";
                //get user
                User u = service.getUser(password,email);
                lblName.Text = u.name;
                Namelbl.Text = u.name;
                Emaillbl.Text = u.email;

                // Fetch product using WCF
               dynamic p = service.GetProductByUserEmail(u.email);
                if (p != null)
                {
                    Passwordlbl.Text = p?.name ?? "product(s) uploaded.:)";
                    foreach (Product Prod in p)
                    {
                        rptProducts.DataSource = Prod;
                        rptProducts.DataBind();
                    }
                }
                else { Passwordlbl.Text = p?.name ?? "No product uploaded.";}
                
                   // lblStatus.Text = product?.ApprovalStatus ?? "Pending";
                  //  lblStatus.CssClass += " " + (product?.ApprovalStatus ?? "pending").ToLower();
                
            }
        }

        protected void HomeBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_Index.aspx");
        }

        protected void AddProd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }
    }
}