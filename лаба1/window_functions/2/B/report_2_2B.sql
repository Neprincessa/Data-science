select CountryRegion, StateProvince, 
count([SalesLT].[Customer].CustomerID) as AmountOfClients,
dense_rank ()  
OVER (partition by CountryRegion order by count([SalesLT].[Customer].CustomerID) ) as DenseRank
from [SalesLT].[Customer]
left join [SalesLT].[CustomerAddress] on [SalesLT].[Customer].CustomerID = [SalesLT].[CustomerAddress].CustomerID 
and [SalesLT].[CustomerAddress].AddressType = 'Main Office'
left join [SalesLT].[Address] on [SalesLT].[Address].AddressID = [SalesLT].[CustomerAddress].AddressID
group by CountryRegion, StateProvince
order by CountryRegion, AmountOfClients , StateProvince;
