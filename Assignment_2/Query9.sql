
--9. Sales Order Shipments by Month and Category Codel with group Number

select d.CalMonth, c.AddrCatCode1, sum(i.ExtCost) as TotalCost, sum(i.Quantity) as Total, Grouping_id(d.CalMonth, c.AddrCatCode1) as Group_Level
from inventory_fact i join date_dim d on i.DateKey = d.Datekey
join cust_vendor_dim c on i.CustVendorKey = c.CustVendorKey 
where i.TransTypeKey = 5 and d.CalYear = 2011
group by cube(d.CalMonth, c.AddrCatCode1)
order by d.CalMonth, c.AddrCatCode1 ;