create view [dbo].[report_tmp] as 
 select [SalesLT].[Customer].CustomerID,FirstName, LastName, LineTotal, Name, SalesPerson, [SalesLT].[Product].ProductID from [SalesLT].[Customer] 
 join [SalesLT].[SalesOrderHeader] on [SalesLT].[SalesOrderHeader].CustomerID = [SalesLT].[Customer].CustomerID 
 join [SalesLT].[SalesOrderDetail] on [SalesLT].[SalesOrderHeader].SalesOrderID = [SalesLT].[SalesOrderDetail].SalesOrderId 
 join [SalesLT].[Product] on [SalesLT].[Product].ProductID = [SalesLT].[SalesOrderDetail].ProductID;
GO

create view Report 
as 
select CustomerID, SalesPerson, ProductID, 
SUM(LineTotal) as TotalSum, "Price Range" =   
  CASE   
        WHEN GROUPING (CustomerID) = 0 and GROUPING (SalesPerson) = 1 and GROUPING (ProductID) = 1 THEN 'Result by customer'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (SalesPerson) = 0 and GROUPING (ProductID) = 1 THEN 'Result by sales person'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (SalesPerson) = 1 and GROUPING (ProductID) = 0 THEN 'Result by product'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (SalesPerson) = 0 and GROUPING (ProductID) = 1 THEN 'Result by customer and sales person'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (SalesPerson) = 1 and GROUPING (ProductID) = 0 THEN 'Result by customer and product'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (SalesPerson) = 0 and GROUPING (ProductID) = 0 THEN 'Result by sales person and product'
       WHEN GROUPING (CustomerID) = 0 and GROUPING (SalesPerson) = 0 and GROUPING (ProductID) = 0 THEN 'Result by customer, sales person, product'
   END
from report_tmp 
group by cube (CustomerID, SalesPerson, ProductID);
GO

select * from Report 
UNION ALL
select null, null, null, count(*), 'amount of rows' from Report;
GO

