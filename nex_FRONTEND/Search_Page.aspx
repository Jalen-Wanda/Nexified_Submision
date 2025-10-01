<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master"  CodeBehind="Search_Page.aspx.cs" Inherits="CampusBookMarket.Search_Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="search-bar">
            <input type="text" placeholder="Search for products..." id="txtSearch" runat="server">
           <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="fas fa-search" OnClick="btnSearch_Click" />
        </div>
    <!-- Auction Section -->
    <section class="result-section">
        <h2 class="section-title">Search Results</h2>

        
          <div class="products" runat="server">
            <!-- Product 1 -->
          <div id="divProducts" class="product-card" runat="server">


         <div class="auction-products">
            <!-- Auction Product 1 -->    
            </div>
            <div class="product-card auction-card">
                <img src="https://preview.redd.it/got-a-used-ipad-pro-m2-11-for-600-v0-wk499ndgyj3d1.jpeg?width=1080&crop=smart&auto=webp&s=aac785f686b76971cf5656b2fdeab7f3630075bc" alt="iPad" class="product-image">
                <div class="product-info">
                    <div class="product-category">Electronics</div>
                    <h3 class="product-title">iPad Pro" (2022)</h3>
                    <div class="product-auction">Auction Item</div>
                    <div class="product-price">Current Bid: R5999.99</div>
                    <div class="countdown" id="countdown1">Time left: 02:15:33</div>
                    <div class="product-actions">
                        <button class="btn btn-bid">Bid Now</button>
                    </div>
                </div>
            </div>

            
    </section>
</asp:Content>