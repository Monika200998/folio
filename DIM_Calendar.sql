-- Cleansed DIM_Date Table --
SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS Date, 
  --[DayNumberOfWeek], 
  [EnglishDayNameOfWeek] AS Day, 
  --[SpanishDayNameOfWeek], 
  --[FrenchDayNameOfWeek], 
  --[DayNumberOfMonth], 
  --[DayNumberOfYear], 
  --[WeekNumberOfYear],
  [EnglishMonthName] AS Month, 
  Left([EnglishMonthName], 3) AS MonthShort,   -- Useful for front end date navigation and front end graphs.
  --[SpanishMonthName], 
  --[FrenchMonthName], 
  [MonthNumberOfYear] AS MonthNo, 
  [CalendarQuarter] AS Quarter, 
  [CalendarYear] AS Year --[CalendarSemester], 
  --[FiscalQuarter], 
  --[FiscalYear], 
  --[FiscalSemester] 
FROM 
 [AdventureWorksDW2019].[dbo].[DimDate]
WHERE 
  CalendarYear >= 2019


FINALLY


CREATE TABLE [dbo].[DimDateCleaned] (
    [DateKey] INT,
    [Date] DATE,
    [Day] NVARCHAR(50),
    [Month] NVARCHAR(50),
    localhost  NVARCHAR(3),
    [MonthNo] INT,
    [Quarter] INT,
    [Year] INT
);

INSERT INTO [dbo].[DimDateCleaned] ([DateKey], [Date], [Day], [Month], [MonthShort], [MonthNo], [Quarter], [Year])
SELECT 
    [DateKey],
    [FullDateAlternateKey] AS Date,
    [EnglishDayNameOfWeek] AS Day,
    [EnglishMonthName] AS Month,
    LEFT([EnglishMonthName], 3) AS MonthShort,
    [MonthNumberOfYear] AS MonthNo,
    [CalendarQuarter] AS Quarter,
    [CalendarYear] AS Year
FROM [AdventureWorksDW].[dbo].[DimDate]
WHERE [CalendarYear] >= 2019;

