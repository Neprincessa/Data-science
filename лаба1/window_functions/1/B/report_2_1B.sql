create view Report_2_1B as
select SalesPerson, count(SalesOrderID) as AmountOfSales,
 DENSE_RANK () over (order by count(SalesOrderID) desc) DenseRank
from [SalesLT].[Customer]
left join [SalesLT].[SalesOrderHeader] on [SalesLT].[SalesOrderHeader].CustomerID = [SalesLT].[Customer].CustomerID
group by SalesPerson;
GO 

create view Report_2_1B as
select SalesPerson, count(SalesOrderID) as AmountOfSales,
 DENSE_RANK () over (order by count(SalesOrderID) desc) DenseRank
from [SalesLT].[Customer]
left join [SalesLT].[SalesOrderHeader] on [SalesLT].[SalesOrderHeader].CustomerID = [SalesLT].[Customer].CustomerID
group by SalesPerson;
GO

select * from Report_2_1B
union all
select 'Amount of rows', count(*), null from Report_2_1B;