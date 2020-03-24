
--6. Rewritten Query 1 without the CUBE or GROUPING SETS operators

select d.CalMonth, c.AddrCatCode1, sum(i.ExtCost) as TotalCost, sum(i.Quantity) as Total
from inventory_fact i join date_dim d on i.DateKey = d.Datekey
join cust_vendor_dim c on i.CustVendorKey = c.CustVendorKey 
where i.TransTypeKey = 5 and d.CalYear = 2011
group by d.CalMonth, c.AddrCatCode1
UNION
select d.CalMonth, null, sum(i.ExtCost) as TotalCost, sum(i.Quantity) as Total
from inventory_fact i join date_dim d on i.DateKey = d.Datekey
join cust_vendor_dim c on i.CustVendorKey = c.CustVendorKey 
where i.TransTypeKey = 5 and d.CalYear = 2011
group by d.CalMonth
UNION
select null, c.AddrCatCode1, sum(i.ExtCost) as TotalCost, sum(i.Quantity) as Total
from inventory_fact i join date_dim d on i.DateKey = d.Datekey
join cust_vendor_dim c on i.CustVendorKey = c.CustVendorKey 
where i.TransTypeKey = 5 and d.CalYear = 2011
group by c.AddrCatCode1
UNION
select null,null, sum(i.ExtCost) as TotalCost, sum(i.Quantity) as Total
from inventory_fact i join date_dim d on i.DateKey = d.Datekey
join cust_vendor_dim c on i.CustVendorKey = c.CustVendorKey 
where i.TransTypeKey = 5 and d.CalYear = 2011