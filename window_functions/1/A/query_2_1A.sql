create view report_2_1A as
select SalesPerson, Count(CustomerID) as AmountOfClients, 
    Rank() over (order by Count(CustomerID)  desc) as RankSalesPerson
from [SalesLT].[Customer]
group by SalesPerson
GO

select * from report_2_1A
union all
select 'Amount of rows', null, count(*) from report_2_1A