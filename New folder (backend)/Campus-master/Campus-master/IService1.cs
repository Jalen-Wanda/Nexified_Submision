using System;
using System.Collections.Generic;
using System.Data;
using System.Runtime.Serialization;
using System.ServiceModel;

namespace CampusService
{
    [DataContract]
    public class ReportData
    {
        [DataMember] public int ProductsSoldCount { get; set; }
        [DataMember] public int TotalStockCount { get; set; }
        [DataMember] public decimal TotalRevenue { get; set; }
        [DataMember] public int ActiveUsersCount { get; set; }
        [DataMember] public decimal TopSpenderAmount { get; set; }
        [DataMember] public decimal AverageUserSpend { get; set; }
        [DataMember] public int ActiveAuctionsCount { get; set; }
        [DataMember] public int CompletedAuctionsCount { get; set; }
        [DataMember] public decimal AverageWinningBid { get; set; }
        [DataMember] public double AuctionSuccessRate { get; set; }
        [DataMember] public int NewUsers { get; set; }
        [DataMember] public int TotalOrders { get; set; }
        [DataMember] public int BestSellingQuantity { get; set; }
        [DataMember] public DataTable SalesByCategory { get; set; }
        [DataMember] public DataTable LowStockItems { get; set; }
        [DataMember] public DataTable StockByCategory { get; set; }
        [DataMember] public DataTable DailyRegistrations { get; set; }
        
    }
    [DataContract]
    public class product
    {
        [DataMember]
        public int Id { get; set; }

        [DataMember]
        public string Name { get; set; }

        [DataMember]
        public string Category { get; set; }

        [DataMember]
        public string Icon { get; set; }

        [DataMember]
        public decimal Price { get; set; }

        [DataMember]
        public DateTime CreatedDate { get; set; }
    }

    [ServiceContract]
   
    public interface IService1
    {

        // User & Auth
        [OperationContract] int Login(string email, string password);
        [OperationContract] int Register(User argUser);
        [OperationContract] User getUser(string password, string email);

        // Products
        [OperationContract] int AddProduct(Product product);
        [OperationContract] Product GetProduct(int id);
        [OperationContract] List<Product> GetProductByUserEmail(string email);
        [OperationContract] List<Product> GetProducts();
        [OperationContract] List<Product> SearchProducts(string searchTerm);
        [OperationContract] int UpdateProduct(Product product);

        // Bidding
        [OperationContract] int PlaceBid(int productId, int userId, decimal bidAmount);
        [OperationContract] List<Bid> GetBidHistory(int productId);
        [OperationContract] List<Bid> GetUserBids(int userId);
        [OperationContract] Bid GetWinningBid(int productId);
        [OperationContract] int CompleteAuction(int productId);

        // Cart
        [OperationContract] int AddToCart(int userId, int productId, int quantity);
        [OperationContract] List<Cart> GetUserCart(int userId);
        [OperationContract] int RemoveFromCart(int cartId);

        // Invoices
        [OperationContract] int CreateInvoice(int userId, decimal totalAmount);
        [OperationContract] int AddInvoiceLine(int invoiceId, int productId, int quantity, decimal price);
        [OperationContract] List<Invoice> GetUserInvoices(int userId);

        // Admin
        [OperationContract] List<Product> GetProductsByUserId(int userId);
        [OperationContract] List<Product> GetProductsForApproval();
        [OperationContract] int ApproveProduct(int productId);
        [OperationContract] int RejectProduct(int productId);

        // Reports
        [OperationContract] int GetProductsSoldCount(DateTime startDate, DateTime endDate);
        [OperationContract] int GetTotalStockCount();
        [OperationContract] decimal GetTotalRevenue(DateTime startDate, DateTime endDate);
        [OperationContract] DataTable GetSalesByCategory(DateTime startDate, DateTime endDate);
        [OperationContract] DataTable GetLowStockProducts(int threshold);
        [OperationContract] DataTable GetStockByCategory();
        [OperationContract] int GetActiveUsersCount(DateTime startDate, DateTime endDate);
        [OperationContract] decimal GetTopSpenderAmount(DateTime startDate, DateTime endDate);
        [OperationContract] decimal GetAverageUserSpend(DateTime startDate, DateTime endDate);
        [OperationContract] int GetActiveAuctionsCount();
        [OperationContract] int GetCompletedAuctionsCount(DateTime startDate, DateTime endDate);
        [OperationContract] decimal GetAverageWinningBid(DateTime startDate, DateTime endDate);
        [OperationContract] double GetAuctionSuccessRate(DateTime startDate, DateTime endDate);
        [OperationContract] DataTable GetDailyRegistrationsReport(DateTime startDate, DateTime endDate);
        [OperationContract] ReportData getReportData(DateTime startDate, DateTime endDate);
    }
}
