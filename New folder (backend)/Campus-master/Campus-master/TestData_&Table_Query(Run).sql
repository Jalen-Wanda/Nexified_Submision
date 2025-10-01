-- Insert regular products (non-auction items)
INSERT INTO [dbo].[Product] ([name], [price], [category], [description], [active], [quatity], [icon], [dateBid])
VALUES 
('Calculus: Early Transcendentals', 889.99, 'Textbook', 'Comprehensive calculus textbook for university students', 1, 15, 'Calculus_early_transcendentals.jpeg', '2000-01-01'),
('MacBook Air 13"', 14000.00, 'Electronics', 'Latest MacBook Air with M2 chip, perfect for students', 1, 8, 'MacBook_Air_13.jpeg', '2000-01-01'),
('LED Desk Lamp with USB', 799.99, 'Dorm Essential', 'Adjustable LED desk lamp with USB charging port', 1, 25, 'LED_Desk_Lamp.jpeg', '2000-01-01'),
('5-Pack College Ruled Notebooks', 449.99, 'Stationery', 'Set of 5 college-ruled notebooks for note-taking', 1, 50, '5-Pack_College_Ruled_Notebooks.jpeg', '2000-01-01'),
('Physics for Scientists and Engineers', 950.00, 'Textbook', 'University physics textbook with latest edition', 1, 12, 'Physics_for_Scientists_and_Engineers.jpeg', '2000-01-01'),
('Wireless Mouse', 299.99, 'Electronics', 'Ergonomic wireless mouse for laptops and desktops', 1, 30, 'Wireless_Mouse.jpeg', '2000-01-01'),
('Bedding Set', 1200.00, 'Dorm Essential', 'Complete bedding set for dorm rooms', 1, 10, 'Bedding_Set.jpeg', '2000-01-01'),
('Stapler and Staple Remover Set', 150.00, 'Stationery', 'Essential office supplies for students', 1, 40, 'Stapler_Staple_Remover_Set.jpeg', '2000-01-01');

-- Insert auction products (with future dateBid)
INSERT INTO [dbo].[Product] ([name], [price], [category], [description], [active], [quatity], [icon], [dateBid])
VALUES 
('iPad Pro (2022)', 5999.99, 'Electronics', 'Like-new iPad Pro with M2 chip and accessories', 1, 1, 'iPad_Pro_(2022).jpeg', DATEADD(DAY, 7, GETDATE())),
('Sony WH-CH720N Wireless Headphones', 1499.99, 'Electronics', 'Premium noise cancelling wireless headphones', 1, 1, 'Sony_WH-CH720N.jpeg', DATEADD(DAY, 3, GETDATE())),
('TI-84 Plus Graphing Calculator', 400.00, 'Stationery', 'Graphing calculator for engineering and math students', 1, 1, 'TI-84_Plus_Graphing_Calculator.jpeg', DATEADD(DAY, 5, GETDATE())),
('Gaming Laptop', 8500.00, 'Electronics', 'High-performance gaming laptop for computer science students', 1, 1, 'Gaming_Laptop.jpeg', DATEADD(DAY, 10, GETDATE())),
('Scientific Calculator Bundle', 600.00, 'Stationery', 'Advanced scientific calculator with case and manual', 1, 1, 'Scientific_Calculator_Bundle.jpeg', DATEADD(DAY, 2, GETDATE()));

-- Insert some inactive products for testing
INSERT INTO [dbo].[Product] ([name], [price], [category], [description], [active], [quatity], [icon], [dateBid])
VALUES 
('Old Edition Textbook', 300.00, 'Textbook', 'Previous edition textbook (inactive product)', 0, 5, 'https://via.placeholder.com/300x200?text=Out+of+Stock', '2000-01-01'),
('Broken Headphones', 100.00, 'Electronics', 'Headphones for parts (inactive)', 0, 2, 'https://via.placeholder.com/300x200?text=Inactive', '2000-01-01');

-- Insert sample users
INSERT INTO [dbo].[User] ([name], [email], [password])
VALUES 
('John Student', 'john.student@university.ac.za', 'password123'),
('Sarah Smith', 'sarah.smith@university.ac.za', 'securepass'),
('Mike Johnson', 'mike.johnson@university.ac.za', 'mikepass'),
('Admin User', 'admin@campussentials.com', 'admin123');

-- Insert sample invoices
INSERT INTO [dbo].[Invoice] ([date], [totalPrice], [userId])
VALUES 
(GETDATE(), 1689.98, 1),
(DATEADD(DAY, -1, GETDATE()), 449.99, 2),
(DATEADD(DAY, -3, GETDATE()), 799.99, 1);

-- Insert sample invoice lines
INSERT INTO [dbo].[InvoiceLine] ([Id], [invoiceId], [productId], [quantity], [price])
VALUES 
(1, 1, 1, 1, 889.99),
(2, 1, 3, 1, 799.99),
(3, 2, 4, 1, 449.99),
(4, 3, 3, 1, 799.99);
ALTER TABLE Product ADD userId INT NULL;
ALTER TABLE Product ADD CONSTRAINT FK_Product_User FOREIGN KEY (userId) REFERENCES [User](Id);
-- Insert sample bids for testing
INSERT INTO [dbo].[Bid] ([productId], [userId], [bidAmount], [bidTime], [isWinningBid])
VALUES 
(9, 1, 5500.00, DATEADD(HOUR, -2, GETDATE()), 0),  -- John bid on iPad
(9, 2, 5800.00, DATEADD(HOUR, -1, GETDATE()), 1),  -- Sarah outbid John (current winner)
(10, 1, 1400.00, DATEADD(HOUR, -3, GETDATE()), 1), -- John bid on headphones
(11, 3, 350.00, DATEADD(HOUR, -1, GETDATE()), 1);  -- Mike bid on calculator

-- Update products with current winners
ALTER TABLE Product
ADD currentWinnerId INT NOT NULL;

UPDATE [dbo].[Product] SET [currentWinnerId] = 2 WHERE [Id] = 9;  -- iPad - Sarah
UPDATE [dbo].[Product] SET [currentWinnerId] = 1 WHERE [Id] = 10; -- Headphones - John
UPDATE [dbo].[Product] SET [currentWinnerId] = 3 WHERE [Id] = 11; -- Calculator - Mike