CREATE TABLE [dbo].[InvoiceLine]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [invoiceId] INT NOT NULL, 
    [productId] INT NOT NULL, 
    [quantity] INT NOT NULL, 
    [price] DECIMAL(10, 2) NOT NULL,
	foreign key([invoiceId]) references [dbo].[Invoice]([id]),
	foreign key([productId]) references [dbo].[Product]([id])
)
CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL identity(1,1) PRIMARY KEY, 
    [name] VARCHAR(MAX) NOT NULL, 
    [email] VARCHAR(MAX) NOT NULL, 
    [password] VARCHAR(MAX) NOT NULL, 
   
)
CREATE TABLE [dbo].[Product]
(
	[Id] INT NOT NULL identity(1,1) PRIMARY KEY, 
    [name] VARCHAR(MAX) NOT NULL, 
    [price] DECIMAL(10, 2) NOT NULL, 
    [category] VARCHAR(MAX) NOT NULL, 
    [description] VARCHAR(MAX) NOT NULL, 
    [active] INT NOT NULL, 
    [quatity] INT NOT NULL, 
    [icon] VARCHAR(MAX) NOT NULL, 
    [dateBid] DATE NOT NULL
)
CREATE TABLE [dbo].[Invoice]
(
	[Id] INT NOT NULL identity(1,1) PRIMARY KEY, 
    
    [date] DATE NOT NULL, 
    [totalPrice] DECIMAL(10, 2) NOT NULL,
	[userId] INT NOT NULL, 
    foreign key([userId]) references [dbo].[User]([Id])
)
