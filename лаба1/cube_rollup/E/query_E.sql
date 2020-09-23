select [SalesLT].[Customer].CustomerID, ProductID, SalesPerson, City, StateProvince, CountryRegion, SUM(OrderQty) as Amount
from [SalesLT].[SalesOrderHeader]
join [SalesLT].[Customer] on [SalesLT].[SalesOrderHeader].CustomerID = [SalesLT].[Customer].CustomerID
join [SalesLT].[SalesOrderDetail] on [SalesLT].[SalesOrderDetail].SalesOrderID = [SalesLT].[SalesOrderHeader].SalesOrderID
join [SalesLT].[CustomerAddress] on [SalesLT].[CustomerAddress].CustomerID = [SalesLT].[Customer].CustomerID
join [SalesLT].[Address] on [SalesLT].[Address].AddressID = [SalesLT].[CustomerAddress].AddressID
group by
rollup([SalesLT].[Customer].CustomerID, ProductID, SalesPerson, City, StateProvince, CountryRegion);

