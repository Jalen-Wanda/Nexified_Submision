using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    
    public partial class index : System.Web.UI.Page
    {
        Service1Client s = new Service1Client();
        public string searchTerm { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            /*dynamic prods = s.GetProducts();

             foreach (Product p in prods)
             {
                 string sHtml = "";
                 string aHTML = "";
                 if (p.dateBid == new DateTime(2000, 1, 1))
                 {
                    sHtml += "<a href=\"#\"";
                    sHtml += "class=\"product-link\"";
                    sHtml += "data-name=\"" + p.name + "\"";
                    sHtml += "data-category=\"" + p.description + "\"";
                    sHtml += "data-price=\""+ p.price + "\"";
                    sHtml += "data-image=\"< img src = images/" + p.icon + "\"";
                    sHtml += "<div class=\"product-card\">";

                    sHtml += "</div>";
                    sHtml += "</a>";

                     sHtml += "< img src = images/" + p.icon + " alt = \"" + p.name + "\" class=\"product - image\">";
                     sHtml += "< div class=\"product-info\">";
                     sHtml += "<div class=\"product-category\">" + p.category + "</div>";
                     sHtml += "<h3 class=\"+product-title\">" + p.name + "</h3>";
                     sHtml += "<div class=\"product-price\">" + p.price + "</div>";
                     sHtml += "<button class=\"btn btn-add-to-cart\">Add to Cart</button>";
                     sHtml += "</div>";
                 }
                 divProducts.InnerHtml = sHtml;
             }*/

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            searchTerm = txtSearch1.Text.Trim();
            if (!searchTerm.Equals("null"))
            {
                Response.Redirect("Search_Page.aspx");
            }


        }
    }
}