select CountryRegion, StateProvince, 
count([SalesLT].[Customer].CustomerID) as AmountOfClients,
percent_rank ()  
OVER (partition by CountryRegion order by count([SalesLT].[Customer].CustomerID) ) as PercentRank
from [SalesLT].[Customer]
join [SalesLT].[CustomerAddress] on [SalesLT].[Customer].CustomerID = [SalesLT].[CustomerAddress].CustomerID 
and [SalesLT].[CustomerAddress].AddressType = 'Main Office'
join [SalesLT].[Address] on [SalesLT].[Address].AddressID = [SalesLT].[CustomerAddress].AddressID
group by CountryRegion, StateProvince
order by CountryRegion, AmountOfClients , StateProvince;