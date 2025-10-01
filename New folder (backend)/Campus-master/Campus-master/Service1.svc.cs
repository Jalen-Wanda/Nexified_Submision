using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace CampusService
{
    public class Service1 : IService1
    {
        DataClasses1DataContext db = new DataClasses1DataContext();

        public int AddProduct(Product p)
        {
            try
            {
                db.Products.InsertOnSubmit(p);
                db.SubmitChanges();
                return 0;
            }
            catch (Exception e)
            {
                e.GetBaseException();
                return -1;
            }
        }

        public Product GetProduct(int id)
        {
            var product = (from p in db.Products where p.Id.Equals(id) select p).FirstOrDefault();
            return product;
        }

        public List<Product> GetProducts()
        {
            /*using (var db = new DataClasses1DataContext())
            {
                dynamic query = from p in db.Products
                            select new Product
                            {
                                Id = p.Id,
                                name = p.name,
                                category = p.category,
                                icon = p.icon,
                                price = p.price,
                                dateAdded = p.dateAdded
                            };

                return query.toList();
            }
            try
            {
                var products = (from p in db.Products where p.active == 1 select p).ToList();
                return products;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting products: " + ex.Message);
                return new List<Product>();
            }*/
            return null;
        }

        public User getUser(string password, string email)
        {
            var user = (from u in db.Users
                        where u.password == password && u.email == email
                        select u).FirstOrDefault();

            if (user == null) return null;

            return new User
            {
                Id = user.Id,
                name = user.name,
                email = user.email,
                password = user.password
            };
        }

        public List<Product> GetProductByUserEmail(string email)
        {
            var user = (from u in db.Users where u.email.Equals(email) select u).FirstOrDefault();
            if (user == null) return null;

            dynamic product = (from p in db.Products where p.userId.Equals(user.Id) select p).FirstOrDefault();
            return product;
        }

        public int Login(string email, string password)
        {
            try
            {
                var user = (from u in db.Users where email == u.email && password == u.password select u).FirstOrDefault();

                if (user == null) return 0;
                else return 1;
            }
            catch (Exception e)
            {
                e.GetBaseException();
                return -1;
            }
        }

        public int Register(User argUser)
        {
            

            try
            {
                var user = (from u in db.Users where u.email.Equals(argUser.email) select u).FirstOrDefault();
                if (user != null) return 1;

                else
                {
                    db.Users.InsertOnSubmit(argUser);
                    db.SubmitChanges();
                    return 0;
                }
             
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine($"Registration Error: {e.Message}");
                System.Diagnostics.Debug.WriteLine($"Stack Trace: {e.StackTrace}");
                e.GetBaseException();
                return -1;
            }
        }
        // Cart methods
        public int AddToCart(int userId, int productId, int quantity)
        {
            try
            {
                var existingItem = (from c in db.Carts
                                    where c.userId == userId && c.productId == productId
                                    select c).FirstOrDefault();

                if (existingItem != null)
                {
                    existingItem.quantity += quantity;
                }
                else
                {
                    Cart newItem = new Cart
                    {
                        userId = userId,
                        productId = productId,
                        quantity = quantity,
                        addedDate = DateTime.Now
                    };
                    db.Carts.InsertOnSubmit(newItem);
                }

                db.SubmitChanges();
                return 1;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in AddToCart: {ex.Message}");
                return -1;
            }
        }

        public List<Cart> GetUserCart(int userId)
        {
            try
            {
                return (from c in db.Carts
                        where c.userId == userId
                        select c).ToList();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetUserCart: {ex.Message}");
                return new List<Cart>();
            }
        }

        public int RemoveFromCart(int cartId)
        {
            try
            {
                var cartItem = (from c in db.Carts
                                where c.Id == cartId
                                select c).FirstOrDefault();

                if (cartItem != null)
                {
                    db.Carts.DeleteOnSubmit(cartItem);
                    db.SubmitChanges();
                    return 1;
                }
                return 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in RemoveFromCart: {ex.Message}");
                return -1;
            }
        }


        public int CreateInvoice(int userId, decimal totalAmount)
        {
            try
            {
                Invoice newInvoice = new Invoice
                {
                    userId = userId,
                    date = DateTime.Now,
                    totalPrice = totalAmount,
                    status = "Completed"
                };

                db.Invoices.InsertOnSubmit(newInvoice);
                db.SubmitChanges();
                return newInvoice.Id;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in CreateInvoice: {ex.Message}");
                return -1;
            }
        }

        public int AddInvoiceLine(int invoiceId, int productId, int quantity, decimal price)
        {
            try
            {
                InvoiceLine newLine = new InvoiceLine
                {
                    invoiceId = invoiceId,
                    productId = productId,
                    quantity = quantity,
                    price = price
                };

                db.InvoiceLines.InsertOnSubmit(newLine);
                db.SubmitChanges();
                return newLine.Id;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in AddInvoiceLine: {ex.Message}");
                return -1;
            }
        }

        public List<Invoice> GetUserInvoices(int userId)
        {
            try
            {
                return (from i in db.Invoices
                        where i.userId == userId
                        orderby i.date descending
                        select i).ToList();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetUserInvoices: {ex.Message}");
                return new List<Invoice>();
            }
        }

        // Admin methods
        public List<Product> GetProductsByUserId(int userId)
        {
            try
            {
                return (from p in db.Products
                        where p.userId == userId
                        select p).ToList();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetProductsByUserId: {ex.Message}");
                return new List<Product>();
            }
        }

        public List<Product> GetProductsForApproval()
        {
            try
            {
                return (from p in db.Products
                        where p.approvalStatus == "Pending"
                        select p).ToList();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetProductsForApproval: {ex.Message}");
                return new List<Product>();
            }
        }

        public int ApproveProduct(int productId)
        {
            try
            {
                var product = (from p in db.Products
                               where p.Id == productId
                               select p).FirstOrDefault();

                if (product != null)
                {
                    product.approvalStatus = "Approved";
                    product.active = 1;
                    db.SubmitChanges();
                    return 1;
                }
                return 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in ApproveProduct: {ex.Message}");
                return -1;
            }
        }

        public int RejectProduct(int productId)
        {
            try
            {
                var product = (from p in db.Products
                               where p.Id == productId
                               select p).FirstOrDefault();

                if (product != null)
                {
                    product.approvalStatus = "Rejected";
                    product.active = 0;
                    db.SubmitChanges();
                    return 1;
                }
                return 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in RejectProduct: {ex.Message}");
                return -1;
            }
        }

        public int GetProductsSoldCount(DateTime startDate, DateTime endDate)
        {
            try
            {
                var productCount = (from il in db.InvoiceLines
                                    join i in db.Invoices on il.invoiceId equals i.Id
                                    where i.date >= startDate && i.date <= endDate
                                    select il.productId).Distinct().Count();

                return productCount;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetProductsSoldCount: {ex.Message}");
                return 0;
            }
        }

        public int GetTotalStockCount()
        {
            try
            {
                var totalStock = (from p in db.Products
                                  where p.active == 1
                                  select p.quatity).DefaultIfEmpty(0).Sum();

                return totalStock;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetTotalStockCount: {ex.Message}");
                return 0;
            }
        }



        public decimal GetTotalRevenue(DateTime startDate, DateTime endDate)
        {
            try
            {
                var revenue = (from i in db.Invoices
                               where i.date >= startDate && i.date <= endDate
                               select i.totalPrice).DefaultIfEmpty(0).Sum();

                return revenue;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetTotalRevenue: {ex.Message}");
                return 0;
            }
        }

        public DataTable GetSalesByCategory(DateTime startDate, DateTime endDate)
        {
            DataTable dt = new DataTable();

            try
            {
                dt.Columns.Add("Category", typeof(string));
                dt.Columns.Add("TotalSales", typeof(decimal));
                dt.Columns.Add("NumberOfOrders", typeof(int));
                dt.Columns.Add("QuantitySold", typeof(int));
                dt.Columns.Add("AveragePrice", typeof(decimal));

                var salesData = (from il in db.InvoiceLines
                                 join i in db.Invoices on il.invoiceId equals i.Id
                                 join p in db.Products on il.productId equals p.Id
                                 where i.date >= startDate && i.date <= endDate
                                 group new { il, p } by p.category into g
                                 select new
                                 {
                                     Category = g.Key,
                                     TotalSales = g.Sum(x => x.il.price * x.il.quantity),
                                     NumberOfOrders = g.Select(x => x.il.invoiceId).Distinct().Count(),
                                     QuantitySold = g.Sum(x => x.il.quantity),
                                     AveragePrice = g.Average(x => x.il.price)
                                 }).ToList();

                foreach (var item in salesData)
                {
                    dt.Rows.Add(item.Category,
                               item.TotalSales,
                               item.NumberOfOrders,
                               item.QuantitySold,
                               item.AveragePrice);
                }

                if (salesData.Count > 0)
                {
                    dt.Rows.Add("TOTAL",
                               salesData.Sum(x => x.TotalSales),
                               salesData.Sum(x => x.NumberOfOrders),
                               salesData.Sum(x => x.QuantitySold),
                               salesData.Average(x => x.AveragePrice));
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetSalesByCategory: {ex.Message}");
                if (dt.Columns.Count == 0)
                {
                    dt.Columns.Add("Category", typeof(string));
                    dt.Columns.Add("TotalSales", typeof(decimal));
                    dt.Columns.Add("NumberOfOrders", typeof(int));
                    dt.Columns.Add("QuantitySold", typeof(int));
                    dt.Columns.Add("AveragePrice", typeof(decimal));
                }
            }

            return dt;
        }

        public DataTable GetLowStockProducts(int threshold)
        {
            DataTable dt = new DataTable();

            try
            {
                dt.Columns.Add("ProductId", typeof(int));
                dt.Columns.Add("ProductName", typeof(string));
                dt.Columns.Add("CurrentStock", typeof(int));
                dt.Columns.Add("Category", typeof(string));
                dt.Columns.Add("Price", typeof(decimal));
                dt.Columns.Add("Status", typeof(string));

                var lowStockProducts = (from p in db.Products
                                        where p.quatity <= threshold && p.active == 1
                                        orderby p.quatity ascending
                                        select p).ToList();

                foreach (var product in lowStockProducts)
                {
                    string status = product.quatity == 0 ? "Out of Stock" :
                                   product.quatity <= 5 ? "Very Low" : "Low";

                    dt.Rows.Add(product.Id, product.name, product.quatity,
                               product.category, product.price, status);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetLowStockProducts: {ex.Message}");
                if (dt.Columns.Count == 0)
                {
                    dt.Columns.Add("ProductId", typeof(int));
                    dt.Columns.Add("ProductName", typeof(string));
                    dt.Columns.Add("CurrentStock", typeof(int));
                    dt.Columns.Add("Category", typeof(string));
                    dt.Columns.Add("Price", typeof(decimal));
                    dt.Columns.Add("Status", typeof(string));
                }
            }

            return dt;
        }

        public DataTable GetStockByCategory()
        {
            DataTable dt = new DataTable();

            try
            {
                dt.Columns.Add("Category", typeof(string));
                dt.Columns.Add("TotalStock", typeof(int));
                dt.Columns.Add("NumberOfProducts", typeof(int));
                dt.Columns.Add("AveragePrice", typeof(decimal));
                dt.Columns.Add("MaxPrice", typeof(decimal));
                dt.Columns.Add("MinPrice", typeof(decimal));

                var stockData = (from p in db.Products
                                 where p.active == 1
                                 group p by p.category into g
                                 select new
                                 {
                                     Category = g.Key,
                                     TotalStock = g.Sum(x => x.quatity),
                                     NumberOfProducts = g.Count(),
                                     AveragePrice = g.Average(x => x.price),
                                     MaxPrice = g.Max(x => x.price),
                                     MinPrice = g.Min(x => x.price)
                                 }).ToList();

                foreach (var item in stockData)
                {
                    dt.Rows.Add(item.Category, item.TotalStock, item.NumberOfProducts,
                               item.AveragePrice, item.MaxPrice, item.MinPrice);
                }

                if (stockData.Count > 0)
                {
                    dt.Rows.Add("TOTAL",
                               stockData.Sum(x => x.TotalStock),
                               stockData.Sum(x => x.NumberOfProducts),
                               stockData.Average(x => x.AveragePrice),
                               stockData.Max(x => x.MaxPrice),
                               stockData.Min(x => x.MinPrice));
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetStockByCategory: {ex.Message}");
                if (dt.Columns.Count == 0)
                {
                    dt.Columns.Add("Category", typeof(string));
                    dt.Columns.Add("TotalStock", typeof(int));
                    dt.Columns.Add("NumberOfProducts", typeof(int));
                    dt.Columns.Add("AveragePrice", typeof(decimal));
                    dt.Columns.Add("MaxPrice", typeof(decimal));
                    dt.Columns.Add("MinPrice", typeof(decimal));
                }
            }

            return dt;
        }

        public int GetActiveUsersCount(DateTime startDate, DateTime endDate)
        {
            try
            {
                var activeUsers = (from i in db.Invoices
                                   where i.date >= startDate && i.date <= endDate
                                   select i.userId).Distinct().Count();

                return activeUsers;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetActiveUsersCount: {ex.Message}");
                return 0;
            }
        }
        public decimal GetTopSpenderAmount(DateTime startDate, DateTime endDate)
        {
            try
            {
                var topSpender = (from i in db.Invoices
                                  where i.date >= startDate && i.date <= endDate
                                  group i by i.userId into g
                                  select g.Sum(x => x.totalPrice))
                                .OrderByDescending(x => x)
                                .FirstOrDefault();

                return topSpender;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetTopSpenderAmount: {ex.Message}");
                return 0;
            }
        }

        public decimal GetAverageUserSpend(DateTime startDate, DateTime endDate)
        {
            try
            {
                var userSpending = (from i in db.Invoices
                                    where i.date >= startDate && i.date <= endDate
                                    group i by i.userId into g
                                    select g.Sum(x => x.totalPrice)).ToList();

                return userSpending.Count > 0 ? userSpending.Average() : 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetAverageUserSpend: {ex.Message}");
                return 0;
            }
        }

        public int GetActiveAuctionsCount()
        {
            try
            {
                var activeAuctions = (from p in db.Products
                                      where p.active == 1 && p.dateBid > DateTime.Now
                                      select p).Count();

                return activeAuctions;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetActiveAuctionsCount: {ex.Message}");
                return 0;
            }
        }

        public int GetCompletedAuctionsCount(DateTime startDate, DateTime endDate)
        {
            try
            {
                var completedAuctions = (from p in db.Products
                                         where p.dateBid >= startDate &&
                                               p.dateBid <= endDate &&
                                               p.dateBid <= DateTime.Now
                                         select p).Count();

                return completedAuctions;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetCompletedAuctionsCount: {ex.Message}");
                return 0;
            }
        }

        public DataTable GetDailyRegistrationsReport(DateTime startDate, DateTime endDate)
        {
            DataTable dt = new DataTable();

            try
            {
                dt.Columns.Add("Date", typeof(string));
                dt.Columns.Add("Registrations", typeof(int));
                dt.Columns.Add("CumulativeTotal", typeof(int));

                var dailyRegs = (from u in db.Users
                                 where u.registrationDate >= startDate && u.registrationDate <= endDate
                                 group u by u.registrationDate.Date into g
                                 orderby g.Key
                                 select new
                                 {
                                     Date = g.Key,
                                     Count = g.Count()
                                 }).ToList();

                int cumulative = 0;
                foreach (var day in dailyRegs)
                {
                    cumulative = cumulative + day.Count;
                    dt.Rows.Add(day.Date.ToString("yyyy-MM-dd"), day.Count, cumulative);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetDailyRegistrationsReport: {ex.Message}");
                if (dt.Columns.Count == 0)
                {
                    dt.Columns.Add("Date", typeof(string));
                    dt.Columns.Add("Registrations", typeof(int));
                    dt.Columns.Add("CumulativeTotal", typeof(int));
                }
            }

            return dt;
        }

        public decimal GetAverageWinningBid(DateTime startDate, DateTime endDate)
        {
            try
            {
                var completedAuctions = (from p in db.Products
                                         where p.dateBid >= startDate &&
                                               p.dateBid <= endDate &&
                                               p.dateBid <= DateTime.Now &&
                                               p.active == 1
                                         select p.price).ToList();

                return completedAuctions.Count > 0 ? completedAuctions.Average() : 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetAverageWinningBid: {ex.Message}");
                return 0;
            }
        }

        public double GetAuctionSuccessRate(DateTime startDate, DateTime endDate)
        {
            try
            {
                var totalAuctions = (from p in db.Products
                                     where p.dateBid >= startDate &&
                                           p.dateBid <= endDate
                                     select p).Count();

                var successfulAuctions = (from p in db.Products
                                          where p.dateBid >= startDate &&
                                                p.dateBid <= endDate &&
                                                p.dateBid <= DateTime.Now &&
                                                p.active == 1
                                          select p).Count();

                return totalAuctions > 0 ? (successfulAuctions * 100.0 / totalAuctions) : 0;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetAuctionSuccessRate: {ex.Message}");
                return 0;
            }
        }


        public List<Product> SearchProducts(string searchTerm)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(searchTerm))
                    return GetProducts();

                var products = (from p in db.Products
                                where p.active == 1 &&
                                      (p.name.Contains(searchTerm) ||
                                       p.category.Contains(searchTerm) ||
                                       p.description.Contains(searchTerm))
                                select p).ToList();

                return products;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in SearchProducts: {ex.Message}");
                return new List<Product>();
            }
        }

        public int UpdateProduct(Product product)
        {
            try
            {
                var existingProduct = (from p in db.Products
                                       where p.Id == product.Id
                                       select p).FirstOrDefault();

                if (existingProduct != null)
                {
                    // Update all relevant fields
                    existingProduct.name = product.name;
                    existingProduct.price = product.price;
                    existingProduct.category = product.category;
                    existingProduct.description = product.description;
                    existingProduct.quatity = product.quatity;
                    existingProduct.icon = product.icon;
                    existingProduct.dateBid = product.dateBid;
                    existingProduct.active = product.active;
                    existingProduct.approvalStatus = product.approvalStatus;

                    db.SubmitChanges();
                    return 1; // Success
                }
                return 0; // Product not found
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in UpdateProduct: {ex.Message}");
                return -1; // Error
            }
        }

        public int PlaceBid(int productId, int userId, decimal bidAmount)
        {
            try
            {
                var product = (from p in db.Products
                               where p.Id == productId && p.active == 1
                               select p).FirstOrDefault();

                if (product == null)
                    return 0; // Product not found or inactive

                // Check if auction is still active (dateBid is in the future)
                if (product.dateBid <= DateTime.Now)
                    return 3; // Auction has ended

                // Check if bid is higher than current price
                if (bidAmount <= product.price)
                    return 2; // Bid too low

                // Create new bid record
                Bid newBid = new Bid
                {
                    productId = productId,
                    userId = userId,
                    bidAmount = bidAmount,
                    bidTime = DateTime.Now,
                    isWinningBid = true // This becomes the new winning bid
                };

                // Update previous winning bids for this product to false
                var previousWinningBids = (from b in db.Bids
                                           where b.productId == productId && b.isWinningBid == true
                                           select b).ToList();

                foreach (var prevBid in previousWinningBids)
                {
                    prevBid.isWinningBid = false;
                }

                // Update product with new highest bid and winner
                product.price = bidAmount;
                product.currentWinnerId = userId;

                // Insert the new bid
                db.Bids.InsertOnSubmit(newBid);
                db.SubmitChanges();

                return 1; // Bid placed successfully
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in PlaceBid: {ex.Message}");
                return -1; // Error
            }
        }
        public List<Bid> GetBidHistory(int productId)
        {
            try
            {
                return (from b in db.Bids
                        where b.productId == productId
                        orderby b.bidTime descending
                        select b).ToList();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetBidHistory: {ex.Message}");
                return new List<Bid>();
            }
        }
        public int CompleteAuction(int productId)
        {
            try
            {
                var product = (from p in db.Products
                               where p.Id == productId
                               select p).FirstOrDefault();

                if (product == null)
                    return 0; // Product not found

                if (product.dateBid > DateTime.Now)
                    return 2; // Auction hasn't ended yet

                var winningBid = GetWinningBid(productId);
                if (winningBid == null)
                {
                    // No bids were placed, mark product as inactive
                    product.active = 0;
                    db.SubmitChanges();
                    return 3; // Auction ended with no bids
                }

                // Here you could create an invoice for the winning bid
                // For now, we'll just mark the auction as completed
                product.active = 0; // Auction ended
                db.SubmitChanges();

                return 1; // Auction completed successfully
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in CompleteAuction: {ex.Message}");
                return -1; // Error
            }
        }
        public List<Bid> GetUserBids(int userId)
        {
            try
            {
                return (from b in db.Bids
                        where b.userId == userId
                        orderby b.bidTime descending
                        select b).ToList();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetUserBids: {ex.Message}");
                return new List<Bid>();
            }
        }
        public Bid GetWinningBid(int productId)
        {
            try
            {
                return (from b in db.Bids
                        where b.productId == productId && b.isWinningBid == true
                        select b).FirstOrDefault();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in GetWinningBid: {ex.Message}");
                return null;
            }
        }
        public ReportData getReportData(DateTime startDate, DateTime endDate)
        {
            var report = new ReportData();

            // Basic metrics
            report.ProductsSoldCount = GetProductsSoldCount(startDate, endDate);
            report.TotalStockCount = GetTotalStockCount();
            report.TotalRevenue = GetTotalRevenue(startDate, endDate);
            report.ActiveUsersCount = GetActiveUsersCount(startDate, endDate);
            report.TopSpenderAmount = GetTopSpenderAmount(startDate, endDate);
            report.AverageUserSpend = GetAverageUserSpend(startDate, endDate);
            report.ActiveAuctionsCount = GetActiveAuctionsCount();
            report.CompletedAuctionsCount = GetCompletedAuctionsCount(startDate, endDate);
            report.AverageWinningBid = GetAverageWinningBid(startDate, endDate);
            report.AuctionSuccessRate = GetAuctionSuccessRate(startDate, endDate);

            // New users = registrations in date range
            report.NewUsers = (from u in db.Users
                               where u.registrationDate >= startDate && u.registrationDate <= endDate
                               select u).Count();

            // Total orders = invoices in date range
            report.TotalOrders = (from i in db.Invoices
                                  where i.date >= startDate && i.date <= endDate
                                  select i).Count();

            // Best selling product quantity in range
            report.BestSellingQuantity = (from il in db.InvoiceLines
                                          join i in db.Invoices on il.invoiceId equals i.Id
                                          where i.date >= startDate && i.date <= endDate
                                          group il by il.productId into g
                                          select g.Sum(x => x.quantity))
                                         .DefaultIfEmpty(0)
                                         .Max();

            // DataTables
            report.SalesByCategory = GetSalesByCategory(startDate, endDate);
            report.LowStockItems = GetLowStockProducts(5); // threshold configurable
            report.StockByCategory = GetStockByCategory();
            report.DailyRegistrations = GetDailyRegistrationsReport(startDate, endDate);

            return report;
        }


    }
}