-- Cleansed FACT_InternetSales Table --
SELECT 
  [ProductKey], 
  [OrderDateKey], 
  [DueDateKey], 
  [ShipDateKey], 
  [CustomerKey], 
  --  ,[PromotionKey]
  --  ,[CurrencyKey]
  --  ,[SalesTerritoryKey]
  [SalesOrderNumber], 
  --  [SalesOrderLineNumber], 
  --  ,[RevisionNumber]
  --  ,[OrderQuantity], 
  --  ,[UnitPrice], 
  --  ,[ExtendedAmount]
  --  ,[UnitPriceDiscountPct]
  --  ,[DiscountAmount] 
  --  ,[ProductStandardCost]
  --  ,[TotalProductCost] 
  [SalesAmount] --  ,[TaxAmt]
  --  ,[Freight]
  --  ,[CarrierTrackingNumber] 
  --  ,[CustomerPONumber] 
  --  ,[OrderDate] 
  --  ,[DueDate] 
  --  ,[ShipDate] 
FROM 
  [dbo].[FactInternetSales]
WHERE 
  LEFT (OrderDateKey, 4) >= 2019
ORDER BY
  OrderDateKey ASC


  FINALLY


  CREATE TABLE [dbo].[FactInternetSalesCleaned] (
    [ProductKey] INT,
    [OrderDateKey] INT,
    [DueDateKey] INT,
    [ShipDateKey] INT,
    [CustomerKey] INT,
    [SalesOrderNumber] NVARCHAR(50),
    [SalesAmount] DECIMAL(18, 2)
);
INSERT INTO [dbo].[FactInternetSalesCleaned] (
    [ProductKey],
    [OrderDateKey],
    [DueDateKey],
    [ShipDateKey],
    [CustomerKey],
    [SalesOrderNumber],
    [SalesAmount]
)
SELECT 
  [ProductKey], 
  [OrderDateKey], 
  [DueDateKey], 
  [ShipDateKey], 
  [CustomerKey], 
  [SalesOrderNumber], 
  [SalesAmount]
FROM 
 [dbo].[FactInternetSales]
WHERE 
  LEFT (OrderDateKey, 4) >= 2019
ORDER BY
  OrderDateKey ASC

