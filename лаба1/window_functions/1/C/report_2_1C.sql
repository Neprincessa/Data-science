create view Report_2_1C as
select SalesPerson, ISNULL(SUM(LineTotal),0) as IncomeSum,
rank() over (order by ISNULL(SUM(LineTotal),0) desc) as RankIncSales
from [SalesLT].[Customer]
left join [SalesLT].[SalesOrderHeader] on [SalesLT].[SalesOrderHeader].CustomerID = [SalesLT].[Customer].CustomerID
left join [SalesLT].[SalesOrderDetail] on [SalesLT].[SalesOrderDetail].SalesOrderID = [SalesLT].[SalesOrderHeader].SalesOrderID
group by SalesPerson;
GO

select * from Report_2_1C
union all
select 'Amount of rows',count(*), null from Report_2_1C