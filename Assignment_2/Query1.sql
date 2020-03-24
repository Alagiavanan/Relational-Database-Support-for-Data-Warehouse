  
--1. Sales Order Shipments by Month and Category Code1

select d.CalMonth, c.AddrCatCode1, sum(i.ExtCost) as TotalCost, sum(i.Quantity) as Total
from inventory_fact i join date_dim d on i.DateKey = d.Datekey
join cust_vendor_dim c on i.CustVendorKey = c.CustVendorKey 
where i.TransTypeKey = 5 and d.CalYear = 2011
group by cube(d.CalMonth, c.AddrCatCode1)
order by d.CalMonth, c.AddrCatCode1;