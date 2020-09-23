create view [dbo].[report_tmp_with0]
as
select [SalesLT].[Customer].CustomerID, [SalesLT].[Product].ProductID, [SalesLT].[Customer].SalesPerson, FirstName, LastName, LineTotal, Name
from [SalesLT].[SalesOrderHeader]
left join [SalesLT].[Customer] on [SalesLT].[Customer].CustomerID = [SalesLT].[SalesOrderHeader].CustomerId
join [SalesLT].[SalesOrderDetail] on [SalesLT].[SalesOrderDetail].SalesOrderID = [SalesLT].[SalesOrderHeader].SalesOrderId
full outer join [SalesLT].[Product] on [SalesLT].[Product].ProductID = [SalesLT].[SalesOrderDetail].ProductID;
GO

create view Report_with_0
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
from report_tmp_with0 
group by cube (CustomerID, SalesPerson, ProductID);
GO

select * from Report_with_0  
UNION ALL
select null, null, null, count(*), 'amount of rows' from Report_with_0;
GO