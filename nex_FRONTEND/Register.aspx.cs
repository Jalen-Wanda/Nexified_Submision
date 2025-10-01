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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Validate inputs first
            if (string.IsNullOrWhiteSpace(fullname.Value) ||
                string.IsNullOrWhiteSpace(reg_email.Value) ||
                string.IsNullOrWhiteSpace(reg_password.Value))
            {
                lblResponse.Visible = true;
                lblResponse.Text = "All fields are required!";
                lblResponse.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (reg_password.Value != confirm_password.Value)
            {
                lblResponse.Visible = true;
                lblResponse.Text = "Passwords Do Not Match!";
                lblResponse.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                Service1Client service = new Service1Client();
                User u = new User();
                u.name = fullname.Value.Trim();
                u.email = reg_email.Value.Trim();
                u.password = Secrecy.HashPassword(confirm_password.Value);
                u.registrationDate = DateTime.Now;

                int response = service.Register(u);

                // Handle response
                if (response == 0)
                {
                    Session["UserEmail"] = reg_email.Value;
                    Response.Redirect("User_index.aspx");
                }
                else if (response == 1)
                {
                    lblResponse.Visible = true;
                    lblResponse.Text = "Email already exists!";
                    lblResponse.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lblResponse.Visible = true;
                    lblResponse.Text = "Registration failed. Please try again.";
                    lblResponse.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblResponse.Visible = true;
                lblResponse.Text = "Error: " + ex.Message;
                lblResponse.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
    }
    
