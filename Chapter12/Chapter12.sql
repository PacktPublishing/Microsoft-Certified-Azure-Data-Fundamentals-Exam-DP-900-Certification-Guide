CHAPTER 12

//STEP 1
-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://packtdatalake.dfs.core.windows.net/packtfilesystem/studentdata.parquet',
        FORMAT = 'PARQUET'
    ) AS [result]


//STEP 2

SELECT TOP (100) [studentID]
,[student_name]
,[gender]
,[course]
,[marks]
,[fees]
,[admission_year]
 FROM [dbo].[student_data1]


//STEP 3

CREATE TABLE fact_sales(
    customerID int,
    productID varchar(30),
    units int,
    price float,
    date datetime,
    city varchar(30)
);

CREATE TABLE dim_product(
    productID int,
    title varchar(30),
    description varchar(150),
    price float
);

CREATE TABLE dim_customer(
    customerID int,
    name varchar(30),
    email varchar(30)
);



INSERT INTO dim_product VALUES (1, 'Bed','King size moden Bed', 1500);
INSERT INTO dim_product VALUES (2, 'Dresser', 'White modern dresser', 800);
INSERT INTO dim_product VALUES (3, 'Chair','Leather Lounge Chair and Ottoman', 1900);
INSERT INTO dim_product VALUES (4, 'Desk', 'Small Desk for Home office', 140);
INSERT INTO dim_product VALUES (5, 'TV', 'High technology SmartTV', 600);

INSERT INTO dim_customer VALUES (1, 'Jason', 'jasonpackt@email.com');
INSERT INTO dim_customer VALUES (2, 'Vicent', 'vincentpackt@email.com');
INSERT INTO dim_customer VALUES (3, 'Ryan', 'ryanpackt@email.com');
INSERT INTO dim_customer VALUES (4, 'Terrance', 'terrancepackt@email.com');
INSERT INTO dim_customer VALUES (5, 'Alison', 'alisonpackt@email.com');
INSERT INTO dim_customer VALUES (6, 'Kelly', 'kellypackt@email.com');
	
INSERT INTO fact_sales VALUES (1, 1, 2, 1500, '8/17/2022', 'San Diego');
INSERT INTO fact_sales VALUES (1, 2, 1, 800, '8/17/2022', 'San Diego');
INSERT INTO fact_sales VALUES (1, 4, 1, 140, '8/17/2022', 'San Diego');
INSERT INTO fact_sales VALUES (1, 5, 1, 600, '8/19/2022', 'San Diego');
INSERT INTO fact_sales VALUES (2, 1, 2, 1500, '8/17/2022', 'San Diego');
INSERT INTO fact_sales VALUES (2, 2, 1, 800, '8/17/2022', 'San Diego');
INSERT INTO fact_sales VALUES (2, 3, 1, 1900, '8/17/2022', 'San Diego');
INSERT INTO fact_sales VALUES (2, 5, 2, 1200, '8/17/2022', 'San Diego');
INSERT INTO fact_sales VALUES (3, 1, 2, 1500, '8/17/2022', 'San Diego');
INSERT INTO fact_sales VALUES (3, 2, 1, 800, '8/18/2022', 'San Diego');
INSERT INTO fact_sales VALUES (3, 3, 1, 1900, '8/18/2022', 'Los Angeles');
INSERT INTO fact_sales VALUES (3, 5, 2, 1200, '8/19/2022', 'Los Angeles');
INSERT INTO fact_sales VALUES (4, 1, 2, 1500, '8/17/2022', 'Los Angeles');
INSERT INTO fact_sales VALUES (4, 2, 1, 800, '8/18/2022', 'Los Angeles');
INSERT INTO fact_sales VALUES (4, 3, 1, 1900, '8/19/2022', 'Los Angeles');
INSERT INTO fact_sales VALUES (4, 5, 2, 1200, '8/19/2022', 'Los Angeles');
INSERT INTO fact_sales VALUES (5, 1, 2, 1500, '8/17/2022', 'Los Angeles');
INSERT INTO fact_sales VALUES (5, 2, 1, 800, '8/17/2022', 'Los Angeles');
INSERT INTO fact_sales VALUES (5, 3, 1, 1900, '8/17/2022', 'Los Angeles');
INSERT INTO fact_sales VALUES (5, 5, 2, 1200, '8/17/2022', 'Los Angeles');
INSERT INTO fact_sales VALUES (5, 1, 2, 1500, '8/17/2022', 'Los Angeles');
INSERT INTO fact_sales VALUES (6, 2, 1, 800, '8/18/2022', 'Los Angeles');
INSERT INTO fact_sales VALUES (6, 3, 1, 1900, '8/18/2022', 'Los Angeles');
INSERT INTO fact_sales VALUES (6, 5, 2, 1200, '8/19/2022', 'Los Angeles');












CREATE TABLE dbo.Dim_Date (
   [DateKey] INT NOT NULL PRIMARY KEY,
   [Date] DATE NOT NULL,
   [Day] TINYINT NOT NULL,
   [DaySuffix] CHAR(2) NOT NULL,
   [Weekday] TINYINT NOT NULL,
   [WeekDayName] VARCHAR(10) NOT NULL,
   [WeekDayName_Short] CHAR(3) NOT NULL,
   [WeekDayName_FirstLetter] CHAR(1) NOT NULL,
   [DOWInMonth] TINYINT NOT NULL,
   [DayOfYear] SMALLINT NOT NULL,
   [WeekOfMonth] TINYINT NOT NULL,
   [WeekOfYear] TINYINT NOT NULL,
   [Month] TINYINT NOT NULL,
   [MonthName] VARCHAR(10) NOT NULL,
   [MonthName_Short] CHAR(3) NOT NULL,
   [MonthName_FirstLetter] CHAR(1) NOT NULL,
   [Quarter] TINYINT NOT NULL,
   [QuarterName] VARCHAR(6) NOT NULL,
   [Year] INT NOT NULL,
   [MMYYYY] CHAR(6) NOT NULL,
   [MonthYear] CHAR(7) NOT NULL,
   [IsWeekend] BIT NOT NULL,
   [IsHoliday] BIT NOT NULL,
   PRIMARY KEY CLUSTERED ([DateKey] ASC)
   )
TRUNCATE TABLE DIM_Date

DECLARE @CurrentDate DATE = '2016-01-01'
DECLARE @EndDate DATE = '2020-12-31'

WHILE @CurrentDate < @EndDate
BEGIN
   INSERT INTO [dbo].[Dim_Date] (
      [DateKey],
      [Date],
      [Day],
      [DaySuffix],
      [Weekday],
      [WeekDayName],
      [WeekDayName_Short],
      [WeekDayName_FirstLetter],
      [DOWInMonth],
      [DayOfYear],
      [WeekOfMonth],
      [WeekOfYear],
      [Month],
      [MonthName],
      [MonthName_Short],
      [MonthName_FirstLetter],
      [Quarter],
      [QuarterName],
      [Year],
      [MMYYYY],
      [MonthYear],
      [IsWeekend],
      [IsHoliday]
      )
   SELECT DateKey = YEAR(@CurrentDate) * 10000 + MONTH(@CurrentDate) * 100 + DAY(@CurrentDate),
      DATE = @CurrentDate,
      Day = DAY(@CurrentDate),
      [DaySuffix] = CASE 
         WHEN DAY(@CurrentDate) = 1
            OR DAY(@CurrentDate) = 21
            OR DAY(@CurrentDate) = 31
            THEN 'st'
         WHEN DAY(@CurrentDate) = 2
            OR DAY(@CurrentDate) = 22
            THEN 'nd'
         WHEN DAY(@CurrentDate) = 3
            OR DAY(@CurrentDate) = 23
            THEN 'rd'
         ELSE 'th'
         END,
      WEEKDAY = DATEPART(dw, @CurrentDate),
      WeekDayName = DATENAME(dw, @CurrentDate),
      WeekDayName_Short = UPPER(LEFT(DATENAME(dw, @CurrentDate), 3)),
      WeekDayName_FirstLetter = LEFT(DATENAME(dw, @CurrentDate), 1),
      [DOWInMonth] = DAY(@CurrentDate),
      [DayOfYear] = DATENAME(dy, @CurrentDate),
      [WeekOfMonth] = DATEPART(WEEK, @CurrentDate) - DATEPART(WEEK, DATEADD(MM, DATEDIFF(MM, 0, @CurrentDate), 0)) + 1,
      [WeekOfYear] = DATEPART(wk, @CurrentDate),
      [Month] = MONTH(@CurrentDate),
      [MonthName] = DATENAME(mm, @CurrentDate),
      [MonthName_Short] = UPPER(LEFT(DATENAME(mm, @CurrentDate), 3)),
      [MonthName_FirstLetter] = LEFT(DATENAME(mm, @CurrentDate), 1),
      [Quarter] = DATEPART(q, @CurrentDate),
      [QuarterName] = CASE 
         WHEN DATENAME(qq, @CurrentDate) = 1
            THEN 'First'
         WHEN DATENAME(qq, @CurrentDate) = 2
            THEN 'second'
         WHEN DATENAME(qq, @CurrentDate) = 3
            THEN 'third'
         WHEN DATENAME(qq, @CurrentDate) = 4
            THEN 'fourth'
         END,
      [Year] = YEAR(@CurrentDate),
      [MMYYYY] = RIGHT('0' + CAST(MONTH(@CurrentDate) AS VARCHAR(2)), 2) + CAST(YEAR(@CurrentDate) AS VARCHAR(4)),
      [MonthYear] = CAST(YEAR(@CurrentDate) AS VARCHAR(4)) + UPPER(LEFT(DATENAME(mm, @CurrentDate), 3)),
      [IsWeekend] = CASE 
         WHEN DATENAME(dw, @CurrentDate) = 'Sunday'
            OR DATENAME(dw, @CurrentDate) = 'Saturday'
            THEN 1
         ELSE 0
         END,
      [IsHoliday] = 0

   SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
END

