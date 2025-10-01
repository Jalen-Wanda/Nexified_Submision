using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;

namespace CampusBookMarket
{
    public partial class Search_Page : System.Web.UI.Page
    {
        Service1Client serv = new Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {
            SearchResults();
        }
        private void SearchResults()
        {
            string searchTerm = Session["SearchTerm"].ToString();
            dynamic prods = serv.SearchProducts(searchTerm);
            string sHtml = "";
            //dynmaic allocation of seach products
            /*foreach (Product p in prods)
            {
                    sHtml += "< img src = images/" + p.icon + " alt = \"" + p.name + "\" class=\"product - image\">";
                    sHtml += "< div class=\"product-info\">";
                    sHtml += "<div class=\"product-category\">" + p.category + "</div>";
                    sHtml += "<h3 class=\"+product-title\">" + p.name + "</h3>";
                    sHtml += "<div class=\"product-price\">" + p.price + "</div>";
                    sHtml += "<button class=\"btn btn-add-to-cart\">Add to Cart</button>";
                    sHtml += "</div>";

                divProducts.InnerHtml = sHtml;
            }*/

        }
    }
}