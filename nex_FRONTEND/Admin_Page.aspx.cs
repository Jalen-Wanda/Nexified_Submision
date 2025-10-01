using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusBookMarket.ServiceReference1;
namespace CampusBookMarket
{
    public partial class Admin_Approve : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // simple admin guard - redirect non-admins
            if (Session == null || Session["IsAdmin"] == null || !(Session["IsAdmin"] is bool) || !(bool)Session["IsAdmin"])
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindPendingProducts();
            }
        }

        private void BindPendingProducts(string search = null)
        {
            //lblStatus.Text = "";
            var client = new Service1Client();
            try
            {
                var items = client.GetProductsForApproval(); // returns Product[]
                if (!string.IsNullOrWhiteSpace(search))
                {
                    var sLower = search.Trim().ToLower();
                    items = items.Where(p =>
                        (!string.IsNullOrEmpty(p.name) && p.name.ToLower().Contains(sLower)) ||
                        (!string.IsNullOrEmpty(p.category) && p.category.ToLower().Contains(sLower)) ||
                        (!string.IsNullOrEmpty(p.description) && p.description.ToLower().Contains(sLower))
                    ).ToArray();
                }

                //gvApprovals.DataSource = items;
                //gvApprovals.DataBind();
                client.Close();
            }
            catch (Exception ex)
            {
                try { client.Abort(); } catch { }
                //lblStatus.ForeColor = System.Drawing.Color.Red;
                //lblStatus.Text = "Failed to load pending products: " + ex.Message;
            }
        }

        protected void gvApprovals_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e == null || string.IsNullOrEmpty(e.CommandName)) return;

            int productId;
            if (!int.TryParse(Convert.ToString(e.CommandArgument), out productId))
                return;

            if (e.CommandName == "Approve")
            {
                ApproveProduct(productId);
            }
            else if (e.CommandName == "Reject")
            {
                RejectProduct(productId);
            }
        }

        private void ApproveProduct(int productId)
        {
            var client = new Service1Client();
            try
            {
                int result = client.ApproveProduct(productId); // 1 success, 0 not found, -1 error
                client.Close();

                if (result == 1)
                {
                    //lblStatus.ForeColor = System.Drawing.Color.Green;
                    //lblStatus.Text = "Product approved.";
                }
                else if (result == 0)
                {
                    //lblStatus.ForeColor = System.Drawing.Color.Orange;
                    //lblStatus.Text = "Product not found.";
                }
                else
                {
                    //lblStatus.ForeColor = System.Drawing.Color.Red;
                    //lblStatus.Text = "Failed to approve product.";
                }
            }
            catch (Exception ex)
            {
                try { client.Abort(); } catch { }
                //lblStatus.ForeColor = System.Drawing.Color.Red;
                //lblStatus.Text = "Error approving product: " + ex.Message;
            }
            finally
            {
                //BindPendingProducts(txtSearch.Text);
            }
        }

        private void RejectProduct(int productId)
        {
            var client = new Service1Client();
            try
            {
                int result = client.RejectProduct(productId); // 1 success, 0 not found, -1 error
                client.Close();

                if (result == 1)
                {
                    //lblStatus.ForeColor = System.Drawing.Color.Green;
                    //lblStatus.Text = "Product rejected.";
                }
                else if (result == 0)
                {
                    //lblStatus.ForeColor = System.Drawing.Color.Orange;
                    //lblStatus.Text = "Product not found.";
                }
                else
                {
                    //lblStatus.ForeColor = System.Drawing.Color.Red;
                    //lblStatus.Text = "Failed to reject product.";
                }
            }
            catch (Exception ex)
            {
                try { client.Abort(); } catch { }
                //lblStatus.ForeColor = System.Drawing.Color.Red;
                //lblStatus.Text = "Error rejecting product: " + ex.Message;
            }
            finally
            {
                //BindPendingProducts(txtSearch.Text);
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            //BindPendingProducts(txtSearch.Text);
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            //txtSearch.Text = "";
            BindPendingProducts();
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            //BindPendingProducts(txtSearch.Text);
        }
    }
}
