create view tmp
as
select [SalesLT].[Customer].CustomerID, [SalesLT].[SalesOrderHeader].SalesOrderID, ShipToAddressID, [SalesLT].[Product].ProductID, OrderQty * UnitPrice * UnitPriceDiscount as Discount, ISNULL(LineTotal,0) as TotalSum
from [SalesLT].[SalesOrderHeader] 
join [SalesLT].[Customer] on [SalesLT].[Customer].CustomerID = [SalesLT].[SalesOrderHeader].CustomerID
join [SalesLT].[SalesOrderDetail] on [SalesLT].[SalesOrderDetail].SalesOrderID = [SalesLT].[SalesOrderHeader].SalesOrderID
join [SalesLT].[Product] on [SalesLT].[SalesOrderDetail].ProductID = [SalesLT].[Product].ProductID
join [SalesLT].[CustomerAddress] on [SalesLT].[Customer].CustomerID = [SalesLT].[CustomerAddress].CustomerID
GO

create view Report_C_1 as
select [SalesLT].[Address].CountryRegion,[SalesLT].[Address].City, [SalesLT].[Address].PostalCode, [SalesLT].[Address].StateProvince,  SUM(TotalSum) as IncomeSum, SUM(Discount) as TotalDiscount
from report_tmp_c 
join [SalesLT].[Address] on [SalesLT].[Address].AddressID = report_tmp_c.ShipToAddressID
group by 
grouping sets (([SalesLT].[Address].City, [SalesLT].[Address].StateProvince, [SalesLT].[Address].CountryRegion), ( [SalesLT].[Address].StateProvince, [SalesLT].[Address].CountryRegion, [SalesLT].[Address].PostalCode), (  [SalesLT].[Address].CountryRegion));
GO

select * from Report_C_1;

