-- Cleansed DIM_Customers Table --
SELECT 
  c.customerkey AS CustomerKey, 
  --      ,[GeographyKey]
  --      ,[CustomerAlternateKey]
  --      ,[Title]
  c.firstname AS [First Name], 
  --      ,[MiddleName]
  c.lastname AS [Last Name], 
  c.firstname + ' ' + lastname AS [Full Name], 
  -- Combined First and Last Name
  --      ,[NameStyle]
  --      ,[BirthDate]
  --      ,[MaritalStatus]
  --      ,[Suffix]
  CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender,
  --      ,[EmailAddress]
  --      ,[YearlyIncome]
  --      ,[TotalChildren]
  --      ,[NumberChildrenAtHome]
  --      ,[EnglishEducation]
  --      ,[SpanishEducation]
  --      ,[FrenchEducation]
  --      ,[EnglishOccupation]
  --      ,[SpanishOccupation]
  --      ,[FrenchOccupation]
  --      ,[HouseOwnerFlag]
  --      ,[NumberCarsOwned]
  --      ,[AddressLine1]
  --      ,[AddressLine2]
  --      ,[Phone]
  c.datefirstpurchase AS DateFirstPurchase, 
  --      ,[CommuteDistance]
  g.city AS [Customer City] -- Joined in Customer City from Geography Table
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] as c
  LEFT JOIN dbo.dimgeography AS g ON g.geographykey = c.geographykey 
ORDER BY 
  CustomerKey ASC -- Ordered List by CustomerKey


FINALLY


CREATE TABLE [dbo].[DimCustomerCleaned] (
    [CustomerKey] INT,
    [FirstName] NVARCHAR(50),
    [LastName] NVARCHAR(50),
    [Gender] NVARCHAR(10),
    [DateFirstPurchase] DATE,
    [CustomerCity] NVARCHAR(100)
);

INSERT INTO [dbo].[DimCustomerCleaned] (
    [CustomerKey],
    [FirstName],
    [LastName],
    [Gender],
    [DateFirstPurchase],
    [CustomerCity]
)
SELECT C.[CustomerKey]
      ,C.[FirstName]
      ,C.[LastName]
      ,CASE C.[Gender] WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender
      ,C.[DateFirstPurchase]
	  ,G.City as [Customer City]
  FROM [AdventureWorksDW].[dbo].[DimCustomer] AS C
  LEFT JOIN dbo.dimgeography AS g ON g.geographykey = c.geographykey
  ORDER BY 
  CustomerKey ASC 