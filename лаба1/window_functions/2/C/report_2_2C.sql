select CountryRegion, StateProvince, City,
    count([SalesLT].[Customer].CustomerID) as AmountOfClients,
    (count([SalesLT].[Customer].CustomerID) - lag(count([SalesLT].[Customer].CustomerID)) over (partition by CountryRegion order by count(Customer.CustomerID) desc, City)) as Difference,
    rank() over (partition by CountryRegion order by count([SalesLT].[Customer].CustomerID) desc, City) as RankAmount
from [SalesLT].[Customer]
    join [SalesLT].[CustomerAddress] on [SalesLT].[Customer].CustomerID = [SalesLT].[CustomerAddress].CustomerID 
    and [SalesLT].[CustomerAddress].AddressType = 'Main Office'
    join [SalesLT].[Address] on [SalesLT].[Address].AddressID = [SalesLT].[CustomerAddress].AddressID
group by CountryRegion, StateProvince, City
order by CountryRegion,City, AmountOfClients desc;

