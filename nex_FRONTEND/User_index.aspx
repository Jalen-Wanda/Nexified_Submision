<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CampusBookMarket.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Campus Essentials Market</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
   
</head>
<body>
    <!-- Navigation Bar -->
   

    <!-- Hero Section -->
    <section class="hero">
        <h1>Everything You Need for University Life</h1>
        <p>Textbooks, electronics, dorm essentials and more - all at student-friendly prices with exclusive auction deals!</p>

        <div class="search-bar">
            <input type="text" placeholder="Search for products...">
            <button><i class="fas fa-search"></i></button>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="categories">
        <h2 class="section-title">Shop by Category</h2>

        <div class="category-filters">
            <div class="category-filter active">All</div>
            <div class="category-filter">Textbooks</div>
            <div class="category-filter">Electronics</div>
            <div class="category-filter">Dorm Essentials</div>
            <div class="category-filter">Stationery</div>
        </div>

        <div class="products">
               <!-- Product 1 -->
               <a href="#" 
                   class="product-link"
                   data-name="Calculus: Early Transcendentals"
                   data-category="Textbook"
                   data-price="889.99"
                   data-image="https://www.wiley.com/storefront-pdp-assets/_next/image?url=https%3A%2F%2Fmedia.wiley.com%2Fproduct_data%2FcoverImage300%2F24%2F11188841%2F1118884124.jpg&w=384&q=75">
            
                <div class="product-card">
                <img src="https://www.wiley.com/storefront-pdp-assets/_next/image?url=https%3A%2F%2Fmedia.wiley.com%2Fproduct_data%2FcoverImage300%2F24%2F11188841%2F1118884124.jpg&w=384&q=75" alt="Calculus Textbook" class="product-image">
                <div class="product-info">
                    <div class="product-category">Textbook</div>
                    <h3 class="product-title">Calculus: Early Transcendentals</h3>
                    <div class="product-price">R889.99</div>
                    <button class="btn btn-add-to-cart">Add to Cart</button>
                </div>
            </div>
               </a>

            <!-- Product 2 -->
            <div class="product-card">
                <img src="https://media.wired.com/photos/65ea34d70264b0ad869cbc18/master/w_1600,c_limit/MacBook-Air-M3-Review-Featured-Gear.jpg" alt="Laptop" class="product-image">
                <div class="product-info">
                    <div class="product-category">Electronics</div>
                    <h3 class="product-title">MacBook Air 13"</h3>
                    <div class="product-price">R14 000.00</div>
                    <button class="btn btn-add-to-cart">Add to Cart</button>
                </div>
            </div>

            <!-- Product 3 -->
            <div class="product-card">
                <img src="https://img.fruugo.com/product/4/20/1724795204_max.jpg" alt="Desk Lamp" class="product-image">
                <div class="product-info">
                    <div class="product-category">Dorm Essential</div>
                    <h3 class="product-title">LED Desk Lamp with USB</h3>
                    <div class="product-price">R799.99</div>
                    <button class="btn btn-add-to-cart">Add to Cart</button>
                </div>
            </div>

            <!-- Product 4 -->
            <div class="product-card">
                <img src="https://media.accobrands.com/media/560-560/517179.jpg?width=560px&height=560px" alt="Notebooks" class="product-image">
                <div class="product-info">
                    <div class="product-category">Stationery</div>
                    <h3 class="product-title">5-Pack College Ruled Notebooks</h3>
                    <div class="product-price">R449.99</div>
                    <button class="btn btn-add-to-cart">Add to Cart</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Auction Section -->
    <section class="auction-section">
        <h2 class="section-title">Auction Items - Bid Now!</h2>

        <div class="auction-products">
            <!-- Auction Product 1 -->
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

            <!-- Auction Product 2 -->
            <div class="product-card auction-card">
                <img src="https://m.media-amazon.com/images/I/51rpbVmi9XL._AC_SL1200_.jpg" alt="Noise Cancelling Headphones" class="product-image">
                <div class="product-info">
                    <div class="product-category">Electronics</div>
                    <h3 class="product-title">Sony WH-CH720N Wireless Noise Cancelling Headphones</h3>
                    <div class="product-auction">Auction Item</div>
                    <div class="product-price">Current Bid: 1499.99</div>
                    <div class="countdown" id="countdown2">Time left: 01:08:47</div>
                    <div class="product-actions">
                        <button class="btn btn-bid">Bid Now</button>
                    </div>
                </div>
            </div>

            <!-- Auction Product 3 -->
            <div class="product-card auction-card">
                <img src="https://m.media-amazon.com/images/I/51IVZSZsWnL._SL500_.jpg" alt="Scientific Calculator" class="product-image">
                <div class="product-info">
                    <div class="product-category">Stationery</div>
                    <h3 class="product-title">TI-84 Plus Graphing Calculator</h3>
                    <div class="product-auction">Auction Item</div>
                    <div class="product-price">Current Bid: R400.00</div>
                    <div class="countdown" id="countdown3">Time left: 04:22:11</div>
                    <div class="product-actions">
                        <button class="btn btn-bid">Bid Now</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    

        <!-- Product Details Modal -->
    <div class="modal" id="productModal">
      <div class="modal-content">
        <div class="modal-header">
          <h2 id="modalProductName"></h2>
          <span class="close-modal">&times;</span>
        </div>
        <div class="modal-body">
          <img id="modalProductImage" class="product-image" style="max-width:200px; margin-bottom:10px;" />
          <p><strong>Category:</strong> <span id="modalProductCategory"></span></p>
          <p><strong>Price:</strong> R <span id="modalProductPrice"></span></p>
        </div>
      </div>
    </div>

    <!-- Cart Sidebar -->
    <div class="cart-sidebar" id="cartSidebar">
        <div class="cart-header">
            <h2>Your Cart</h2>
            <span class="close-cart">&times;</span>
        </div>

        <div class="cart-items">
            <!-- Cart Item 1 -->
            <div class="cart-item">
                <img src="https://www.wiley.com/storefront-pdp-assets/_next/image?url=https%3A%2F%2Fmedia.wiley.com%2Fproduct_data%2FcoverImage300%2F24%2F11188841%2F1118884124.jpg&w=384&q=75" alt="Calculus Textbook" class="cart-item-image">
                <div class="cart-item-details">
                    <div class="cart-item-title">Calculus: Early Transcendentals</div>
                    <div class="cart-item-price">R889.99</div>
                </div>
                <button class="cart-item-remove">&times;</button>
            </div>

            <!-- Cart Item 2 -->
            <div class="cart-item">
                <img src="https://img.fruugo.com/product/4/20/1724795204_max.jpg" alt="Desk Lamp" class="cart-item-image">
                <div class="cart-item-details">
                    <div class="cart-item-title">LED Desk Lamp with USB</div>
                    <div class="cart-item-price">R799.99</div>
                </div>
                <button class="cart-item-remove">&times;</button>
            </div>

            <!-- Cart Item 3 -->
            <div class="cart-item">
                <img src="https://images.unsplash.com/photo-1531346680769-a1d79b57de5c?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Notebooks" class="cart-item-image">
                <div class="cart-item-details">
                    <div class="cart-item-title">5-Pack College Ruled Notebooks</div>
                    <div class="cart-item-price">R449.99</div>
                </div>
                <button class="cart-item-remove">&times;</button>
            </div>
        </div>

        <div class="cart-total">Total: $87.97</div>
        <button class="checkout-btn">Proceed to Checkout</button>
    </div>

    <script>
        // DOM Elements
        const loginBtn = document.getElementById('loginBtn');
        const registerBtn = document.getElementById('registerBtn');
        const cartIcon = document.getElementById('cartIcon');
        const loginModal = document.getElementById('loginModal');
        const registerModal = document.getElementById('registerModal');
        const cartSidebar = document.getElementById('cartSidebar');
        const closeModalButtons = document.querySelectorAll('.close-modal, .close-cart');
        const categoryFilters = document.querySelectorAll('.category-filter');
        const countdowns = document.querySelectorAll('.countdown');


        cartIcon.addEventListener('click', () => cartSidebar.classList.add('open'));

        closeModalButtons.forEach(button => {
            button.addEventListener('click', () => {
                loginModal.style.display = 'none';
                registerModal.style.display = 'none';
                cartSidebar.classList.remove('open');
            });
        });

       

        // Category filter functionality
        categoryFilters.forEach(filter => {
            filter.addEventListener('click', () => {
                // Remove active class from all filters
                categoryFilters.forEach(f => f.classList.remove('active'));
                // Add active class to clicked filter
                filter.classList.add('active');
                // In a real application, this would filter the products
            });
        });

        // Countdown Timer for Auction Items
        function updateCountdowns() {
            // This is a simplified version - in a real application,
            // you would have specific end times for each auction
            countdowns.forEach((countdown, index) => {
                let text = countdown.textContent;
                let timeArray = text.match(/(\d{2}):(\d{2}):(\d{2})/);

                if (timeArray) {
                    let hours = parseInt(timeArray[1]);
                    let minutes = parseInt(timeArray[2]);
                    let seconds = parseInt(timeArray[3]);

                    seconds--;

                    if (seconds < 0) {
                        seconds = 59;
                        minutes--;

                        if (minutes < 0) {
                            minutes = 59;
                            hours--;

                            if (hours < 0) {
                                // Auction ended
                                countdown.textContent = "Auction ended!";
                                return;
                            }
                        }
                    }

                    countdown.textContent = `Time left: ${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
                }
            });
        }

        // Update countdowns every second
        setInterval(updateCountdowns, 1000);

        // Add to Cart functionality
        const addToCartButtons = document.querySelectorAll('.btn-add-to-cart');
        const cartCount = document.querySelector('.cart-count');
        let count = 3; // Initial count from the example

        addToCartButtons.forEach(button => {
            button.addEventListener('click', () => {
                count++;
                cartCount.textContent = count;

                // Show confirmation
                button.textContent = "Added!";
                setTimeout(() => {
                    button.textContent = "Add to Cart";
                }, 1500);
            });
        });

        // Remove item from cart
        const removeButtons = document.querySelectorAll('.cart-item-remove');
        removeButtons.forEach(button => {
            button.addEventListener('click', () => {
                button.closest('.cart-item').remove();
                count--;
                cartCount.textContent = count;

                // Update total (simplified)
                const totalElement = document.querySelector('.cart-total');
                const currentTotal = parseFloat(totalElement.textContent.replace('Total: $', ''));
                const itemPrice = parseFloat(button.closest('.cart-item').querySelector('.cart-item-price').textContent.replace('$', ''));
                totalElement.textContent = `Total: $${(currentTotal - itemPrice).toFixed(2)}`;
            });
        });
        // Product Modal
        const productLinks = document.querySelectorAll(".product-link");
        const productModal = document.getElementById("productModal");
        const closeProductModal = productModal.querySelector(".close-modal");

        productLinks.forEach(link => {
            link.addEventListener("click", function (e) {
                e.preventDefault();

                // Fill modal with product data
                document.getElementById("modalProductName").textContent = this.dataset.name;
                document.getElementById("modalProductCategory").textContent = this.dataset.category;
                document.getElementById("modalProductPrice").textContent = this.dataset.price;
                document.getElementById("modalProductImage").src = this.dataset.image;

                // Show modal
                productModal.style.display = "block";
            });
        });

        // Close modal
        closeProductModal.addEventListener("click", () => {
            productModal.style.display = "none";
        });

        // Close if clicked outside content
        window.addEventListener("click", (e) => {
            if (e.target === productModal) {
                productModal.style.display = "none";
            }
        });
    </script>

</body>
</html>
</asp:Content>
