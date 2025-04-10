			-- Cleansed DIM_Products Table --
SELECT 
  p.[ProductKey], 
  p.[ProductAlternateKey] AS ProductItemCode, 
  --      ,[ProductSubcategoryKey], 
  --      ,[WeightUnitMeasureCode]
  --      ,[SizeUnitMeasureCode] 
  p.[EnglishProductName] AS [Product Name], 
  ps.EnglishProductSubcategoryName AS [Sub Category], -- Joined in from Sub Category Table
  pc.EnglishProductCategoryName AS [Product Category], -- Joined in from Category Table
  --      ,[SpanishProductName]
  --      ,[FrenchProductName]
  --      ,[StandardCost]
  --      ,[FinishedGoodsFlag] 
  p.[Color] AS [Product Color], 
  --      ,[SafetyStockLevel]
  --      ,[ReorderPoint]
  --      ,[ListPrice] 
  p.[Size] AS [Product Size], 
  --      ,[SizeRange]
  --      ,[Weight]
  --      ,[DaysToManufacture]
  p.[ProductLine] AS [Product Line], 
  --     ,[DealerPrice]
  --      ,[Class]
  --      ,[Style] 
  p.[ModelName] AS [Product Model Name], 
  --      ,[LargePhoto]
  p.[EnglishDescription] AS [Product Description], 
  --      ,[FrenchDescription]
  --      ,[ChineseDescription]
  --      ,[ArabicDescription]
  --      ,[HebrewDescription]
  --      ,[ThaiDescription]
  --      ,[GermanDescription]
  --      ,[JapaneseDescription]
  --      ,[TurkishDescription]
  --      ,[StartDate], 
  --      ,[EndDate], 
  ISNULL (p.Status, 'Outdated') AS [Product Status] 
FROM 
  [dbo].[DimProduct] as p
  LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN dbo.DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey 
order by 
  p.ProductKey asc


  --FINALLY


  CREATE TABLE [dbo].[DimProductCleaned] (
    [ProductKey] INT,
    [ProductItemCode] NVARCHAR(50),
    [ProductName] NVARCHAR(255),
    [SubCategory] NVARCHAR(255),
    [ProductCategory] NVARCHAR(255),
    [ProductColor] NVARCHAR(50),
    [ProductSize] NVARCHAR(50),
    [ProductLine] NVARCHAR(50),
    [ProductModelName] NVARCHAR(255),
    [ProductDescription] NVARCHAR(MAX),
    [ProductStatus] NVARCHAR(50)
);
INSERT INTO [dbo].[DimProductCleaned] (
    [ProductKey],
    [ProductItemCode],
    [ProductName],
    [SubCategory],
    [ProductCategory],
    [ProductColor],
    [ProductSize],
    [ProductLine],
    [ProductModelName],
    [ProductDescription],
    [ProductStatus]
)
SELECT 
    p.[ProductKey], 
    p.[ProductAlternateKey] AS ProductItemCode, 
    p.[EnglishProductName] AS [Product Name], 
    ps.[EnglishProductSubcategoryName] AS [Sub Category], 
    pc.[EnglishProductCategoryName] AS [Product Category], 
    p.[Color] AS [Product Color], 
    p.[Size] AS [Product Size], 
    p.[ProductLine] AS [Product Line], 
    p.[ModelName] AS [Product Model Name], 
    p.[EnglishDescription] AS [Product Description], 
    ISNULL(p.[Status], 'Outdated') AS [Product Status]
FROM 
    [dbo].[DimProduct] AS p
    LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.[ProductSubcategoryKey] = p.[ProductSubcategoryKey]
    LEFT JOIN dbo.DimProductCategory AS pc ON ps.[ProductCategoryKey] = pc.[ProductCategoryKey]
ORDER BY 
    p.[ProductKey] ASC;

