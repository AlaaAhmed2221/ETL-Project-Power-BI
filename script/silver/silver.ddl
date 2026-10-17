------DDL Silver LAyER----------

--------Human_Resources-------------
IF OBJECT_ID('silver.HR_departments', 'U') IS NOT NULL
    DROP TABLE silver.HR_departments;

create table silver.HR_departments(
	departmentID smallint,
	name varchar(50),
	groupName varchar(50),
	modifiedDate datetime
)
GO

IF OBJECT_ID('silver.HR_employee', 'U') IS NOT NULL
    DROP TABLE silver.HR_employee;
GO

CREATE TABLE silver.HR_employee (
    BusinessEntityID    INT           ,
    NationalIDNumber    NVARCHAR(15)  ,
    LoginID             NVARCHAR(256) ,
    OrganizationNode    HIERARCHYID   ,
    OrganizationLevel   SMALLINT      ,
    JobTitle            NVARCHAR(50)  ,
    BirthDate           DATE          ,
    MaritalStatus       NCHAR(1)      ,
    Gender              NCHAR(1)      ,
    HireDate            DATE          ,
    SalariedFlag        BIT           ,
    VacationHours       SMALLINT      ,
    SickLeaveHours      SMALLINT      ,
    CurrentFlag         BIT           ,
    rowguid             UNIQUEIDENTIFIER ,
    ModifiedDate        DATETIME      
)
GO

IF OBJECT_ID('silver.HR_employeeDepartmentHistory', 'U') IS NOT NULL
    DROP TABLE silver.HR_employeeDepartmentHistory;
GO

CREATE TABLE silver.HR_employeeDepartmentHistory (
    BusinessEntityID    INT           ,
    DepartmentID        SMALLINT      ,
    ShiftID             TINYINT       ,
    StartDate           DATE          ,
    EndDate             DATE          ,
    ModifiedDate        DATETIME      
);
GO

IF OBJECT_ID('silver.HR_employeePayHistory', 'U') IS NOT NULL
    DROP TABLE silver.HR_employeePayHistory;
GO

CREATE TABLE silver.HR_employeePayHistory (
    BusinessEntityID    INT           ,
    RateChangeDate      DATETIME      ,
    Rate                MONEY         ,
    PayFrequency        TINYINT       ,
    ModifiedDate        DATETIME      
);
GO

IF OBJECT_ID('silver.HR_jobCandidate', 'U') IS NOT NULL
    DROP TABLE silver.HR_jobCandidate;
GO

CREATE TABLE silver.HR_jobCandidate (
    JobCandidateID      INT           ,
    BusinessEntityID    INT           ,
    Resume              XML           ,
    ModifiedDate        DATETIME      
);
GO

IF OBJECT_ID('silver.HR_shift', 'U') IS NOT NULL
    DROP TABLE silver.HR_shift;
GO

CREATE TABLE silver.HR_shift (
    ShiftID             TINYINT       ,
    Name                NVARCHAR(50)  ,
    StartTime           TIME          ,
    EndTime             TIME          ,
    ModifiedDate        DATETIME      
);
GO


IF OBJECT_ID('silver.Person_Address', 'U') IS NOT NULL
    DROP TABLE silver.Person_Address;

CREATE TABLE silver.Person_Address (
    AddressID INT,
    AddressLine1 NVARCHAR(60),
    AddressLine2 NVARCHAR(60),
    City NVARCHAR(30),
    StateProvinceID INT,
    PostalCode NVARCHAR(15),
    SpatialLocation GEOGRAPHY,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Person_AddressType', 'U') IS NOT NULL
    DROP TABLE silver.Person_AddressType;

CREATE TABLE silver.Person_AddressType (
    AddressTypeID INT,
    Name NVARCHAR(50),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Person_BusinessEntity', 'U') IS NOT NULL
    DROP TABLE silver.Person_BusinessEntity;

CREATE TABLE silver.Person_BusinessEntity (
    BusinessEntityID INT,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Person_BusinessEntityAddress', 'U') IS NOT NULL
    DROP TABLE silver.Person_BusinessEntityAddress;

CREATE TABLE silver.Person_BusinessEntityAddress (
    BusinessEntityID INT,
    AddressID INT,
    AddressTypeID INT,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);

IF OBJECT_ID('silver.Person_BusinessEntityContact', 'U') IS NOT NULL
    DROP TABLE silver.Person_BusinessEntityContact;

CREATE TABLE silver.Person_BusinessEntityContact (
    BusinessEntityID INT,
    PersonID INT,
    ContactTypeID INT,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);

IF OBJECT_ID('silver.Person_ContactType', 'U') IS NOT NULL
    DROP TABLE silver.Person_ContactType;

CREATE TABLE silver.Person_ContactType (
    ContactTypeID INT,
    Name NVARCHAR(50),
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Person_CountryRegion', 'U') IS NOT NULL
    DROP TABLE silver.Person_CountryRegion;

CREATE TABLE silver.Person_CountryRegion (
    CountryRegionCode NVARCHAR(3),
    Name NVARCHAR(50),
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Person_EmailAddress', 'U') IS NOT NULL
    DROP TABLE silver.Person_EmailAddress;

CREATE TABLE silver.Person_EmailAddress (
    BusinessEntityID INT,
    EmailAddressID INT,
    EmailAddress NVARCHAR(50),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Person_Password', 'U') IS NOT NULL
    DROP TABLE silver.Person_Password;

CREATE TABLE silver.Person_Password (
    BusinessEntityID INT,
    PasswordHash VARCHAR(128),
    PasswordSalt VARCHAR(10),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);


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
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Person_PersonPhone', 'U') IS NOT NULL
    DROP TABLE silver.Person_PersonPhone;

CREATE TABLE silver.Person_PersonPhone (
    BusinessEntityID INT,
    PhoneNumber NVARCHAR(25),
    PhoneNumberTypeID INT,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Person_PhoneNumberType', 'U') IS NOT NULL
    DROP TABLE silver.Person_PhoneNumberType;

CREATE TABLE silver.Person_PhoneNumberType (
    PhoneNumberTypeID INT,
    Name NVARCHAR(50),
    ModifiedDate DATETIME
);

IF OBJECT_ID('silver.Person_StateProvince', 'U') IS NOT NULL
    DROP TABLE silver.Person_StateProvince;

CREATE TABLE silver.Person_StateProvince (
    StateProvinceID INT,
    StateProvinceCode NCHAR(3),
    CountryRegionCode NVARCHAR(3),
    IsOnlyStateProvinceFlag BIT,
    Name NVARCHAR(50),
    TerritoryID INT,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);

----------production--------------

IF OBJECT_ID('silver.production_billOfMaterials', 'U') IS NOT NULL
    DROP TABLE silver.production_billOfMaterials;


create table silver.production_billOfMaterials(
billOfMaterialID int,
productAssemblyID int,
componentID int,
startDate datetime,
endDate datetime,
unitMeasureCode nchar(3),
BOMlevel smallint,
perAssemplyQTY decimal(8,2),
modifiedDate datetime
)


IF OBJECT_ID('silver.Production_Culture', 'U') IS NOT NULL
    DROP TABLE silver.Production_Culture;

CREATE TABLE silver.Production_Culture (
    CultureID NCHAR(6),
    Name NVARCHAR(50),
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Production_Document', 'U') IS NOT NULL
    DROP TABLE silver.Production_Document;

CREATE TABLE silver.Production_Document (
    DocumentNode HIERARCHYID,
    DocumentLevel INT,
    Title NVARCHAR(50),
    Owner INT,
    FolderFlag BIT,
    FileName NVARCHAR(400),
    FileExtension NVARCHAR(8),
    Revision NCHAR(5),
    ChangeNumber INT,
    Status TINYINT,
    DocumentSummary NVARCHAR(MAX),
    Document VARBINARY(MAX),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);

IF OBJECT_ID('silver.Production_Illustration', 'U') IS NOT NULL
    DROP TABLE silver.Production_Illustration;

CREATE TABLE silver.Production_Illustration (
    IllustrationID INT,
    Diagram XML,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Production_Location', 'U') IS NOT NULL
    DROP TABLE silver.Production_Location;

CREATE TABLE silver.Production_Location (
    LocationID SMALLINT,
    Name NVARCHAR(50),
    CostRate SMALLINT,
    Availability DECIMAL(8, 2),
    ModifiedDate DATETIME
);


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
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Production_ProductCategory', 'U') IS NOT NULL
    DROP TABLE silver.Production_ProductCategory;

CREATE TABLE silver.Production_ProductCategory (
    ProductCategoryID INT,
    Name NVARCHAR(50),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);

IF OBJECT_ID('silver.Production_ProductCostHistory', 'U') IS NOT NULL
    DROP TABLE silver.Production_ProductCostHistory;

CREATE TABLE silver.Production_ProductCostHistory (
    ProductID INT,
    StartDate DATETIME,
    EndDate DATETIME,
    StandardCost MONEY,
    ModifiedDate DATETIME
);

IF OBJECT_ID('silver.Production_ProductDescription', 'U') IS NOT NULL
    DROP TABLE silver.Production_ProductDescription;

CREATE TABLE silver.Production_ProductDescription (
    ProductDescriptionID INT,
    Description NVARCHAR(400),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);

IF OBJECT_ID('silver.Production_Document', 'U') IS NOT NULL
    DROP TABLE silver.Production_Document;

CREATE TABLE silver.Production_Document (
    DocumentNode HIERARCHYID,
    DocumentLevel INT,
    Title NVARCHAR(50),
    Owner INT,
    FolderFlag BIT,
    FileName NVARCHAR(400),
    FileExtension NVARCHAR(8),
    Revision NCHAR(5),
    ChangeNumber INT,
    Status TINYINT,
    DocumentSummary NVARCHAR(MAX),
    Document VARBINARY(MAX),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Production_ProductInventory', 'U') IS NOT NULL
    DROP TABLE silver.Production_ProductInventory;

CREATE TABLE silver.Production_ProductInventory (
    ProductID INT,
    LocationID SMALLINT,
    Shelf NVARCHAR(10),
    Bin TINYINT,
    Quantity SMALLINT,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);

IF OBJECT_ID('silver.Production_ProductListPriceHistory', 'U') IS NOT NULL
    DROP TABLE silver.Production_ProductListPriceHistory;

CREATE TABLE silver.Production_ProductListPriceHistory (
    ProductID INT,
    StartDate DATETIME,
    EndDate DATETIME,
    ListPrice MONEY,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Production_ProductModel', 'U') IS NOT NULL
    DROP TABLE silver.Production_ProductModel;

CREATE TABLE silver.Production_ProductModel (
    ProductModelID INT,
    Name NVARCHAR(50),
    CatalogDescription XML,
    Instructions XML,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Production_ProductModelIllustration', 'U') IS NOT NULL
    DROP TABLE silver.Production_ProductModelIllustration;

CREATE TABLE silver.Production_ProductModelIllustration (
    ProductModelID INT,
    IllustrationID INT,
    ModifiedDate DATETIME
);

IF OBJECT_ID('silver.Production_ProductModelProductDescriptionCulture', 'U') IS NOT NULL
    DROP TABLE silver.Production_ProductModelProductDescriptionCulture;

CREATE TABLE silver.Production_ProductModelProductDescriptionCulture (
    ProductModelID INT,
    ProductDescriptionID INT,
    CultureID NCHAR(6),
    ModifiedDate DATETIME
);



IF OBJECT_ID('silver.production_productPhoto', 'U') IS NOT NULL
    DROP TABLE silver.production_productPhoto;

create table silver.production_productPhoto(
productphotoID int,
thumNailPhoto varbinary(max),
largePhotofileName nvarchar(50),
modifiedDate datetime
)


IF OBJECT_ID('silver.production_proproductPhoto', 'U') IS NOT NULL
    DROP TABLE silver.production_proproductPhoto;

create table silver.production_proproductPhoto(
	productID int,
	productphotoID int,
	primaryy bit,
	modifiedDate datetime
)


IF OBJECT_ID('silver.Production_ProductReview', 'U') IS NOT NULL
    DROP TABLE silver.Production_ProductReview;

create table silver.Production_ProductReview(
	productReviewID int,
	productID int,
	reviewName nvarchar(50),
	reviewDate datetime,
	emailAddress nvarchar(50),
	rating int,
	comments nvarchar(3850),
	modifiedDate datetime
)

IF OBJECT_ID('silver.Production_ProductSubcategory', 'U') IS NOT NULL
    DROP TABLE silver.Production_ProductSubcategory;

CREATE TABLE silver.Production_ProductSubcategory (
    ProductSubcategoryID INT,
    ProductCategoryID INT,
    Name NVARCHAR(50),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Production_ScrapReason', 'U') IS NOT NULL
    DROP TABLE silver.Production_ScrapReason;

CREATE TABLE silver.Production_ScrapReason (
    ScrapReasonID SMALLINT,
    Name NVARCHAR(50),
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Production_TransactionHistory', 'U') IS NOT NULL
    DROP TABLE silver.Production_TransactionHistory;

CREATE TABLE silver.Production_TransactionHistory (
    TransactionID INT,
    ProductID INT,
    ReferenceOrderID INT,
    ReferenceOrderLineID INT,
    TransactionDate DATETIME,
    TransactionType NCHAR(1),
    Quantity INT,
    ActualCost MONEY,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Production_TransactionHistoryArchive', 'U') IS NOT NULL
    DROP TABLE silver.Production_TransactionHistoryArchive;

CREATE TABLE silver.Production_TransactionHistoryArchive (
    TransactionID INT,
    ProductID INT,
    ReferenceOrderID INT,
    ReferenceOrderLineID INT,
    TransactionDate DATETIME,
    TransactionType NCHAR(1),
    Quantity INT,
    ActualCost MONEY,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Production_UnitMeasure', 'U') IS NOT NULL
    DROP TABLE silver.Production_UnitMeasure;

CREATE TABLE silver.Production_UnitMeasure (
    UnitMeasureCode NCHAR(3),
    Name NVARCHAR(50),
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Production_WorkOrder', 'U') IS NOT NULL
    DROP TABLE silver.Production_WorkOrder;

CREATE TABLE silver.Production_WorkOrder (
    WorkOrderID INT,
    ProductID INT,
    OrderQty INT,
    StockedQty INT,
    ScrappedQty SMALLINT,
    StartDate DATETIME,
    EndDate DATETIME,
    DueDate DATETIME,
    ScrapReasonID SMALLINT,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Production_WorkOrderRouting', 'U') IS NOT NULL
    DROP TABLE silver.Production_WorkOrderRouting;

CREATE TABLE silver.Production_WorkOrderRouting (
    WorkOrderID INT,
    ProductID INT,
    OperationSequence SMALLINT,
    LocationID SMALLINT,
    ScheduledStartDate DATETIME,
    ScheduledEndDate DATETIME,
    ActualStartDate DATETIME,
    ActualEndDate DATETIME,
    ActualResourceHrs DECIMAL(9, 4),
    PlannedCost MONEY,
    ActualCost MONEY,
    ModifiedDate DATETIME
);


---------purchasing----------
IF OBJECT_ID('silver.Purchasing_Vendor', 'U') IS NOT NULL
    DROP TABLE silver.Purchasing_Vendor;

CREATE TABLE silver.Purchasing_Vendor (
    BusinessEntityID INT,
    AccountNumber NVARCHAR(15),
    Name NVARCHAR(50),
    CreditRating TINYINT,
    PreferredVendorStatus BIT,
    ActiveFlag BIT,
    PurchasingWebServiceURL NVARCHAR(1024),
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Purchasing_PurchaseOrderDetail', 'U') IS NOT NULL
    DROP TABLE silver.Purchasing_PurchaseOrderDetail;

CREATE TABLE silver.Purchasing_PurchaseOrderDetail (
    PurchaseOrderID INT,
    PurchaseOrderDetailID INT,
    DueDate DATETIME,
    OrderQty SMALLINT,
    ProductID INT,
    UnitPrice MONEY,
    LineTotal MONEY,
    ReceivedQty DECIMAL(8, 2),
    RejectedQty DECIMAL(8, 2),
    StockedQty AS (ReceivedQty - RejectedQty),
    ModifiedDate DATETIME
);

IF OBJECT_ID('silver.Purchasing_PurchaseOrderHeader', 'U') IS NOT NULL
    DROP TABLE silver.Purchasing_PurchaseOrderHeader;

CREATE TABLE silver.Purchasing_PurchaseOrderHeader (
    PurchaseOrderID INT,
    RevisionNumber TINYINT,
    Status TINYINT,
    EmployeeID INT,
    VendorID INT,
    ShipMethodID INT,
    OrderDate DATETIME,
    ShipDate DATETIME,
    SubTotal MONEY,
    TaxAmt MONEY,
    Freight MONEY,
    TotalDue MONEY,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Purchasing_ShipMethod', 'U') IS NOT NULL
    DROP TABLE silver.Purchasing_ShipMethod;

CREATE TABLE silver.Purchasing_ShipMethod (
    ShipMethodID INT,
    Name NVARCHAR(50),
    ShipBase MONEY,
    ShipRate MONEY,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);

IF OBJECT_ID('silver.Purchasing_ProductVendor', 'U') IS NOT NULL
    DROP TABLE silver.Purchasing_ProductVendor;

CREATE TABLE silver.Purchasing_ProductVendor (
    ProductID INT,
    BusinessEntityID INT,
    AverageLeadTime INT,
    StandardPrice MONEY,
    LastReceiptCost MONEY,
    LastReceiptDate DATETIME,
    MinOrderQty INT,
    MaxOrderQty INT,
    OnOrderQty INT,
    UnitMeasureCode NCHAR(3),
    ModifiedDate DATETIME
);

--------Sales---------------

IF OBJECT_ID('silver.sales_countryRegionCurrency', 'U') IS NOT NULL
    DROP TABLE silver.sales_countryRegionCurrency;

create table silver.sales_countryRegionCurrency(
	countryRegionCode nvarchar(3),
	currencyCode nchar(3),
	modifiedDate datetime
)


IF OBJECT_ID('silver.Sales_CreditCard', 'U') IS NOT NULL
    DROP TABLE silver.Sales_CreditCard;

CREATE TABLE silver.Sales_CreditCard (
    CreditCardID INT,
    CardType NVARCHAR(50),
    CardNumber NVARCHAR(25),
    ExpMonth TINYINT,
    ExpYear SMALLINT,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Sales_Currency', 'U') IS NOT NULL
    DROP TABLE silver.Sales_Currency;

CREATE TABLE silver.Sales_Currency (
    CurrencyCode NCHAR(3),
    Name NVARCHAR(50),
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Sales_CurrencyRate', 'U') IS NOT NULL
    DROP TABLE silver.Sales_CurrencyRate;

CREATE TABLE silver.Sales_CurrencyRate (
    CurrencyRateID INT,
    CurrencyRateDate DATETIME,
    FromCurrencyCode NCHAR(3),
    ToCurrencyCode NCHAR(3),
    AverageRate MONEY,
    EndOfDayRate MONEY,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Sales_Customer', 'U') IS NOT NULL
    DROP TABLE silver.Sales_Customer;

CREATE TABLE silver.Sales_Customer (
    CustomerID INT,
    PersonID INT,
    StoreID INT,
    TerritoryID INT,
    AccountNumber VARCHAR(10),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Sales_PersonCreditCard', 'U') IS NOT NULL
    DROP TABLE silver.Sales_PersonCreditCard;

CREATE TABLE silver.Sales_PersonCreditCard (
    BusinessEntityID INT,
    CreditCardID INT,
    ModifiedDate DATETIME
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
    ModifiedDate DATETIME
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
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Sales_SalesOrderHeaderSalesReason', 'U') IS NOT NULL
    DROP TABLE silver.Sales_SalesOrderHeaderSalesReason;

CREATE TABLE silver.Sales_SalesOrderHeaderSalesReason (
    SalesOrderID INT,
    SalesReasonID INT,
    ModifiedDate DATETIME
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
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Sales_SalesPersonQuotaHistory', 'U') IS NOT NULL
    DROP TABLE silver.Sales_SalesPersonQuotaHistory;

CREATE TABLE silver.Sales_SalesPersonQuotaHistory (
    BusinessEntityID INT,
    QuotaDate DATETIME,
    SalesQuota MONEY,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Sales_SalesReason', 'U') IS NOT NULL
    DROP TABLE silver.Sales_SalesReason;

CREATE TABLE silver.Sales_SalesReason (
    SalesReasonID INT,
    Name NVARCHAR(50),
    ReasonType NVARCHAR(50),
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Sales_SalesTaxRate', 'U') IS NOT NULL
    DROP TABLE silver.Sales_SalesTaxRate;

CREATE TABLE silver.Sales_SalesTaxRate (
    SalesTaxRateID INT,
    StateProvinceID INT,
    TaxType TINYINT,
    TaxRate SMALLMONEY,
    Name NVARCHAR(50),
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
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
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Sales_SalesTerritoryHistory', 'U') IS NOT NULL
    DROP TABLE silver.Sales_SalesTerritoryHistory;

CREATE TABLE silver.Sales_SalesTerritoryHistory (
    BusinessEntityID INT,
    TerritoryID INT,
    StartDate DATETIME,
    EndDate DATETIME,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Sales_ShoppingCartItem', 'U') IS NOT NULL
    DROP TABLE silver.Sales_ShoppingCartItem;

CREATE TABLE silver.Sales_ShoppingCartItem (
    ShoppingCartItemID INT,
    ShoppingCartID NVARCHAR(50),
    Quantity INT,
    ProductID INT,
    DateCreated DATETIME,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Sales_SpecialOffer', 'U') IS NOT NULL
    DROP TABLE silver.Sales_SpecialOffer;

CREATE TABLE silver.Sales_SpecialOffer (
    SpecialOfferID INT,
    Description NVARCHAR(255),
    DiscountPct SMALLMONEY,
    Type NVARCHAR(50),
    Category NVARCHAR(50),
    StartDate DATETIME,
    EndDate DATETIME,
    MinQty INT,
    MaxQty INT,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);


IF OBJECT_ID('silver.Sales_SpecialOfferProduct', 'U') IS NOT NULL
    DROP TABLE silver.Sales_SpecialOfferProduct;

CREATE TABLE silver.Sales_SpecialOfferProduct (
    SpecialOfferID INT,
    ProductID INT,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);



IF OBJECT_ID('silver.Sales_Store', 'U') IS NOT NULL
    DROP TABLE silver.Sales_Store;

CREATE TABLE silver.Sales_Store (
    BusinessEntityID INT,
    Name NVARCHAR(50),
    SalesPersonID INT,
    Demographics XML,
    rowguid UNIQUEIDENTIFIER,
    ModifiedDate DATETIME
);
