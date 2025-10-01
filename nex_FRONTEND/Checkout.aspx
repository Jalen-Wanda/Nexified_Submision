<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="CampusBookMarket.Checkout" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quick Checkout</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .checkout-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .checkout-header h1 {
            color: #2c3e50;
            margin-bottom: 10px;
        }
        
        .checkout-header p {
            color: #7f8c8d;
        }
        
        .checkout-container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
        }
        
        .checkout-form {
            flex: 1;
            min-width: 300px;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .order-summary {
            flex: 1;
            min-width: 300px;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .section-title {
            font-size: 1.2rem;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
            color: #2c3e50;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #2c3e50;
        }
        
        input, select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border 0.3s;
        }
        
        input:focus, select:focus {
            border-color: #3498db;
            outline: none;
        }
        
        .form-row {
            display: flex;
            gap: 15px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .cart-item {
            display: flex;
            justify-content: space-between;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }
        
        .item-details h4 {
            margin-bottom: 5px;
            color: #2c3e50;
        }
        
        .item-details p {
            color: #7f8c8d;
            font-size: 0.9rem;
        }
        
        .item-price {
            font-weight: 600;
            color: #2c3e50;
        }
        
        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
        }
        
        .summary-total {
            font-weight: 700;
            font-size: 1.2rem;
            border-top: 1px solid #eee;
            padding-top: 15px;
            margin-top: 10px;
            color: #2c3e50;
        }
        
        .btn {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            display: block;
            padding: 15px;
            background: #3498db;
            color: white;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 20px;
        }
        
        .btn:hover {
            background: #2980b9;
        }
        
        .secure-checkout {
            text-align: center;
            margin-top: 15px;
            color: #7f8c8d;
            font-size: 0.9rem;
        }
        
        .secure-checkout i {
            color: #27ae60;
            margin-right: 5px;
        }
        
        @media (max-width: 768px) {
            .checkout-container {
                flex-direction: column;
            }
            
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="checkout-header">
            <h1>&nbsp;Checkout</h1>
            <p>Complete your purchase in just a few steps</p>
        </div>
        
        <div class="checkout-container">
            <div class="checkout-form">
                <h2 class="section-title">Shipping Information</h2>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" placeholder="your@email.com">
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input type="text" id="firstName" placeholder="John">
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" id="lastName" placeholder="Doe">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="address">Street Address</label>
                    <input type="text" id="address" placeholder="123 Main St">
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="city">City</label>
                        <input type="text" id="city" placeholder="New York">
                    </div>
                    <div class="form-group">
                        <label for="state">State</label>
                        <select id="state">
                            <option value="">Select State</option>
                            <option value="NY">New York</option>
                            <option value="CA">California</option>
                            <option value="TX">Texas</option>
                            <option value="FL">Florida</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="zip">ZIP Code</label>
                        <input type="text" id="zip" placeholder="10001">
                    </div>
                </div>
                                     
                
                <asp:Button ID="btnCheckout"  class="btn" runat="server" Text="Complete Purchase" Height="84px" OnClick="btnCheckout_Click" />
                
                
                
                <div class="secure-checkout">
                     Your payment information is secure and encrypted
                </div>
            </div>
            
            <div class="order-summary">
                <h2 class="section-title">Order Summary</h2>
                
                <div class="cart-item">
                    <div class="item-details">
                        <h4>Wireless Bluetooth Headphones</h4>
                        <p>Color: Black · Quantity: 1</p>
                    </div>
                    <div class="item-price">$89.99</div>
                </div>
                
                <div class="cart-item">
                    <div class="item-details">
                        <h4>Phone Case</h4>
                        <p>Model: iPhone 14 · Quantity: 1</p>
                    </div>
                    <div class="item-price">$19.99</div>
                </div>
                
                <div class="cart-item">
                    <div class="item-details">
                        <h4>Screen Protector</h4>
                        <p>Pack of 2 · Quantity: 1</p>
                    </div>
                    <div class="item-price">$12.99</div>
                </div>
                
                <div class="summary-row">
                    <span>Subtotal</span>
                    <span>$122.97</span>
                </div>
                
                <div class="summary-row">
                    <span>Shipping</span>
                    <span>$5.99</span>
                </div>
                
                <div class="summary-row">
                    <span>Tax</span>
                    <span>$9.84</span>
                </div>
                
                <div class="summary-row summary-total">
                    <span>Total</span>
                    <span>$138.80</span>
                </div>
                
                <div class="promo-code">
                    <h3 class="section-title">Promo Code</h3>
                    <div class="form-group">
                        <input type="text" ID= "txtPromo"  placeholder="Enter promo code" runat ="server"/>
                            
                    </div>
                    <asp:Button ID="btnCode" runat="server"   Text="Apply Code" BackColor="#66FF66" OnClick="btnCode_Click" />
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Simple form validation
            const form = document.querySelector('.checkout-form');
            const completeBtn = document.querySelector('.btn');
            
            completeBtn.addEventListener('click', function(e) {
                e.preventDefault();
                
                const email = document.getElementById('email').value;
                const firstName = document.getElementById('firstName').value;
                const lastName = document.getElementById('lastName').value;
                const address = document.getElementById('address').value;
                const cardNumber = document.getElementById('cardNumber').value;
                
                if (!email || !firstName || !lastName || !address || !cardNumber) {
                    alert('Please fill in all required fields');
                    return;
                }
                
                // In a real application, you would process the payment here
                alert('Thank you for your purchase! Your order has been placed.');
            });
        });
    </script>
</body>
</html>
