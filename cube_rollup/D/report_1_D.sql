create view report_d_tmp as
select [SalesLT].[SalesOrderDetail].SalesOrderId, [SalesLT].[Product].ProductID, [SalesLT].[Product].Name, [SalesLT].[Product].ProductCategoryID as Category, SelfCategory.ParentProductCategoryID as HigherLevelCategory, 
 LineTotal, OrderQty * UnitPrice * UnitPriceDiscount as Discount
from [SalesLT].[SalesOrderHeader] 
join [SalesLT].[SalesOrderDetail] on [SalesLT].[SalesOrderDetail].SalesOrderID = [SalesLT].[SalesOrderHeader].SalesOrderID
join [SalesLT].[Product] on [SalesLT].[SalesOrderDetail].ProductID = [SalesLT].[Product].ProductID
join [SalesLT].[ProductCategory] as SelfCategory on [SalesLT].[Product].ProductCategoryID = SelfCategory.ProductCategoryID
left join [SalesLT].[ProductCategory] as ParentCategory on SelfCategory.ParentProductCategoryID = ParentCategory.ProductCategoryID
GO

create view Report_D as
select Name, Category, HigherLevelCategory, SUM(LineTotal) as TotalSum, SUM(Discount) as TotalDiscount
from report_d_tmp
group by
rollup (Category, HigherLevelCategory, Name); 
GO

select * from Report_D
union all
select  'Amount of rows',count(*),null, null,null from Report_D;


