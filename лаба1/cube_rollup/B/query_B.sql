create view report_b_tmp as 
select [SalesLT].[Customer].CustomerID, [SalesLT].[SalesOrderHeader].SalesOrderID, ShipToAddressID, BillToAddressID, [SalesLT].[CustomerAddress].AddressID as ResidenceID, SalesPerson, [SalesLT].[Product].ProductID, ISNULL(LineTotal,0) as TotalSum
from [SalesLT].[SalesOrderHeader] 
join [SalesLT].[Customer] on [SalesLT].[Customer].CustomerID = [SalesLT].[SalesOrderHeader].CustomerID
join [SalesLT].[SalesOrderDetail] on [SalesLT].[SalesOrderDetail].SalesOrderID = [SalesLT].[SalesOrderHeader].SalesOrderID
join [SalesLT].[Product] on [SalesLT].[SalesOrderDetail].ProductID = [SalesLT].[Product].ProductID
join [SalesLT].[CustomerAddress] on [SalesLT].[Customer].CustomerID = [SalesLT].[CustomerAddress].CustomerID
GO

create view Report_B as
select report_b_tmp.CustomerID, ProductID,Ship.CountryRegion as ShipAddress, 
Bill.CountryRegion as BillAddress, Residence.CountryRegion as ResidenceAddress,
SUM(TotalSum) as IncomeSum,
 "Price Range" =   
  CASE   
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by residence'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by bill address'
		WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by bill address and residence'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by ship address'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by residence and ship address'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by ship and bill address'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by residence, ship and bill address'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by product'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by product and residence'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by product and bill address'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by residence, bill address, product'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by product, ship address'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by product, ship address, residence'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by product, ship and bill address'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by residence, ship and bill address, product'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by customer'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by residence and customer'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by customer and bill address'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by customer, bill address and residence'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by ship address and customer'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by customer, ship address, residence'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by customer, ship and bill address'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by customer, ship and bill address, residence'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by customer and product'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by residence, customer and product'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by customer, product, bill address'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by residence, bill address, customer, product'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by customer, product, ship address'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by customer, product, ship address, residence'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Result by customer, product, bill and ship address'
        WHEN GROUPING (CustomerID) = 1 and GROUPING (ProductID) = 1 and GROUPING(Ship.CountryRegion) = 1 and GROUPING(Bill.CountryRegion) = 1 AND GROUPING(Residence.CountryRegion) = 1  THEN 'Result by all categories'
        WHEN GROUPING (CustomerID) = 0 and GROUPING (ProductID) = 0 and GROUPING(Ship.CountryRegion) = 0 and GROUPING(Bill.CountryRegion) = 0 AND GROUPING(Residence.CountryRegion) = 0  THEN 'Usual data'
   END
from 
report_b_tmp,
[SalesLT].[Address] Ship,
[SalesLT].[Address] Bill,
[SalesLT].[Address] Residence
where
Ship.AddressID = report_b_tmp.ShipToAddressID
and Bill.AddressID = report_b_tmp.BillToAddressID
and Residence.AddressID = report_b_tmp.ResidenceID
group by cube (CustomerID, ProductID, Ship.CountryRegion, Bill.CountryRegion, Residence.CountryRegion);
GO

select * from Report_B
union all
select null, null, null, null,null, count(*), 'amount of rows' from Report_B;
GO




--for example
with tmp_q (CustomerID, SalesOrderID, ShipToAddressID,BillToAddressID, ResidenceID, SalesPerson, ProductID,TotalSum)
as 
(
select [SalesLT].[Customer].CustomerID, [SalesLT].[SalesOrderHeader].SalesOrderID, ShipToAddressID, BillToAddressID, [SalesLT].[CustomerAddress].AddressID as ResidenceID, SalesPerson, [SalesLT].[Product].ProductID, ISNULL(LineTotal,0) as TotalSum
from [SalesLT].[SalesOrderHeader] 
join [SalesLT].[Customer] on [SalesLT].[Customer].CustomerID = [SalesLT].[SalesOrderHeader].CustomerID
join [SalesLT].[SalesOrderDetail] on [SalesLT].[SalesOrderDetail].SalesOrderID = [SalesLT].[SalesOrderHeader].SalesOrderID
join [SalesLT].[Product] on [SalesLT].[SalesOrderDetail].ProductID = [SalesLT].[Product].ProductID
join [SalesLT].[CustomerAddress] on [SalesLT].[Customer].CustomerID = [SalesLT].[CustomerAddress].CustomerID
) select tmp_q.CustomerID, ProductID,Ship.CountryRegion as ShipAddress, 
Bill.CountryRegion as BillAddress, Residence.CountryRegion as ResidenceAddress,
SUM(TotalSum) as IncomeSum
from 
tmp_q,
[SalesLT].[Address] Ship,
[SalesLT].[Address] Bill,
[SalesLT].[Address] Residence
where
Ship.AddressID = tmp_q.ShipToAddressID
and Bill.AddressID = tmp_q.BillToAddressID
and Residence.AddressID = tmp_q.ResidenceID
group by cube (CustomerID, ProductID, Ship.CountryRegion, Bill.CountryRegion, Residence.CountryRegion);
