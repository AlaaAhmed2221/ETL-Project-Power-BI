------DDL Silver LAyER----------
use AdventureWorks_ETL

-----------person----------
IF OBJECT_ID('silver.Person_Person', 'U') IS NOT NULL
    DROP TABLE silver.Person_Person;

CREATE TABLE silver.Person_Person (
    BusinessEntityID INT,
    PersonType NCHAR(2),
    NameStyle BIT,
    Title NVARCHAR(8),
    FirstName NVARCHAR(50),
    MiddleName NVARCHAR(50),
    LastName NVARCHAR(50),
    Suffix NVARCHAR(10),
    EmailPromotion INT,
    AdditionalContactInfo XML,
    Demographics XML,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME,
	dwh_create_date    DATETIME2 DEFAULT GETDATE()
);

----------production--------------

IF OBJECT_ID('silver.Production_Product', 'U') IS NOT NULL
    DROP TABLE silver.Production_Product;

CREATE TABLE silver.Production_Product (
    ProductID INT,
    Name NVARCHAR(50),
    ProductNumber NVARCHAR(25),
    MakeFlag BIT,
    FinishedGoodsFlag BIT,
    Color NVARCHAR(15),
    SafetyStockLevel SMALLINT,
    ReorderPoint SMALLINT,
    StandardCost MONEY,
    ListPrice MONEY,
    Size NVARCHAR(5),
    SizeUnitMeasureCode NCHAR(3),
    WeightUnitMeasureCode NCHAR(3),
    Weight DECIMAL(8, 2),
    DaysToManufacture INT,
    ProductLine NCHAR(2),
    Class NCHAR(2),
    Style NCHAR(2),
    ProductSubcategoryID INT,
    ProductModelID INT,
    SellStartDate DATETIME,
    SellEndDate DATETIME,
    DiscontinuedDate DATETIME,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME,
	dwh_create_date    DATETIME2 DEFAULT GETDATE()
);


IF OBJECT_ID('silver.Production_ProductCategory', 'U') IS NOT NULL
    DROP TABLE silver.Production_ProductCategory;

CREATE TABLE silver.Production_ProductCategory (
    ProductCategoryID INT,
    Name NVARCHAR(50),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME,
	dwh_create_date    DATETIME2 DEFAULT GETDATE()
);


IF OBJECT_ID('silver.Production_ProductSubcategory', 'U') IS NOT NULL
    DROP TABLE silver.Production_ProductSubcategory;

CREATE TABLE silver.Production_ProductSubcategory (
    ProductSubcategoryID INT,
    ProductCategoryID INT,
    Name NVARCHAR(50),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME,
	dwh_create_date    DATETIME2 DEFAULT GETDATE()
);

--------Sales---------------

IF OBJECT_ID('silver.Sales_Customer', 'U') IS NOT NULL
    DROP TABLE silver.Sales_Customer;

CREATE TABLE silver.Sales_Customer (
    CustomerID INT,
    PersonID INT,
    StoreID INT,
    TerritoryID INT,
    AccountNumber VARCHAR(10),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME,
	dwh_create_date    DATETIME2 DEFAULT GETDATE()
);



IF OBJECT_ID('silver.Sales_SalesOrderDetail', 'U') IS NOT NULL
    DROP TABLE silver.Sales_SalesOrderDetail;

CREATE TABLE silver.Sales_SalesOrderDetail (
    SalesOrderID INT,
    SalesOrderDetailID INT,
    CarrierTrackingNumber NVARCHAR(25),
    OrderQty SMALLINT,
    ProductID INT,
    SpecialOfferID INT,
    UnitPrice MONEY,
    UnitPriceDiscount MONEY,
    LineTotal NUMERIC(38, 6),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME,
	dwh_create_date    DATETIME2 DEFAULT GETDATE()
);


IF OBJECT_ID('silver.Sales_SalesOrderHeader', 'U') IS NOT NULL
    DROP TABLE silver.Sales_SalesOrderHeader;

CREATE TABLE silver.Sales_SalesOrderHeader (
    SalesOrderID INT,
    RevisionNumber TINYINT,
    OrderDate DATETIME,
    DueDate DATETIME,
    ShipDate DATETIME,
    Status TINYINT,
    OnlineOrderFlag BIT,
    SalesOrderNumber NVARCHAR(23),
    PurchaseOrderNumber NVARCHAR(25),
    AccountNumber NVARCHAR(15),
    CustomerID INT,
    SalesPersonID INT,
    TerritoryID INT,
    BillToAddressID INT,
    ShipToAddressID INT,
    ShipMethodID INT,
    CreditCardID INT,
    CreditCardApprovalCode VARCHAR(15),
    CurrencyRateID INT,
    SubTotal MONEY,
    TaxAmt MONEY,
    Freight MONEY,
    TotalDue MONEY,
    Comment NVARCHAR(128),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME,
	dwh_create_date    DATETIME2 DEFAULT GETDATE()
);



IF OBJECT_ID('silver.Sales_SalesPerson', 'U') IS NOT NULL
    DROP TABLE silver.Sales_SalesPerson;

CREATE TABLE silver.Sales_SalesPerson (
    BusinessEntityID INT,
    TerritoryID INT,
    SalesQuota MONEY,
    Bonus MONEY,
    CommissionPct SMALLMONEY,
    SalesYTD MONEY,
    SalesLastYear MONEY,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME,
	dwh_create_date    DATETIME2 DEFAULT GETDATE()
);



IF OBJECT_ID('silver.Sales_SalesTerritory', 'U') IS NOT NULL
    DROP TABLE silver.Sales_SalesTerritory;

CREATE TABLE silver.Sales_SalesTerritory (
    TerritoryID INT,
    Name NVARCHAR(50),
    CountryRegionCode NVARCHAR(3),
    [Group] NVARCHAR(50),
    SalesYTD MONEY,
    SalesLastYear MONEY,
    CostYTD MONEY,
    CostLastYear MONEY,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME,
	dwh_create_date    DATETIME2 DEFAULT GETDATE()
);


IF OBJECT_ID('silver.Sales_Store', 'U') IS NOT NULL
    DROP TABLE silver.Sales_Store;

CREATE TABLE silver.Sales_Store (
    BusinessEntityID INT,
    Name NVARCHAR(50),
    SalesPersonID INT,
    Demographics XML,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME,
	dwh_create_date    DATETIME2 DEFAULT GETDATE()
);
