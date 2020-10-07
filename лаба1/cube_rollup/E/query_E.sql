create view Report_E as
select [SalesLT].[Customer].CustomerID, ProductID, SalesPerson, City, StateProvince, CountryRegion, SUM(OrderQty) as Amount
from [SalesLT].[SalesOrderHeader]
join [SalesLT].[Customer] on [SalesLT].[SalesOrderHeader].CustomerID = [SalesLT].[Customer].CustomerID
join [SalesLT].[SalesOrderDetail] on [SalesLT].[SalesOrderDetail].SalesOrderID = [SalesLT].[SalesOrderHeader].SalesOrderID
join [SalesLT].[CustomerAddress] on [SalesLT].[CustomerAddress].CustomerID = [SalesLT].[Customer].CustomerID
join [SalesLT].[Address] on [SalesLT].[Address].AddressID = [SalesLT].[CustomerAddress].AddressID
group by
rollup (CountryRegion, StateProvince, City),
cube ([SalesLT].[Customer].CustomerID, ProductID, SalesPerson) 
go

select * from Report_E 
union all
select null,null, null,null, null, 'Amount of rows', count(*) from Report_E
order by Amount;
