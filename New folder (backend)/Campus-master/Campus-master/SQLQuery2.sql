CREATE TABLE [dbo].[Bid] (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [productId] INT NOT NULL,
    [userId] INT NOT NULL,
    [bidAmount] DECIMAL(18,2) NOT NULL,
    [bidTime] DATETIME NOT NULL,
    [isWinningBid] BIT NOT NULL DEFAULT 0,
    CONSTRAINT [FK_Bid_Product] FOREIGN KEY ([productId]) REFERENCES [Product]([Id]),
    CONSTRAINT [FK_Bid_User] FOREIGN KEY ([userId]) REFERENCES [User]([Id])
);

-- Create index for better performance on bid queries
CREATE INDEX [IX_Bid_Product] ON [dbo].[Bid] ([productId]);
CREATE INDEX [IX_Bid_User] ON [dbo].[Bid] ([userId]);
CREATE INDEX [IX_Bid_Time] ON [dbo].[Bid] ([bidTime]);

-- Add a column to Product table to track the current winning bidder
ALTER TABLE [dbo].[Product] ADD [currentWinnerId] INT NULL;
ALTER TABLE [dbo].[Product] ADD CONSTRAINT [FK_Product_CurrentWinner] FOREIGN KEY ([currentWinnerId]) REFERENCES [User]([Id]);