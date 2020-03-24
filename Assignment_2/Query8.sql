
--8. Sales Order Shipments by Name and Combination of Year and Quarter

select d.CalYear, d.CalQuarter, c.Name , sum(i.ExtCost) as TotalCost, count(i.Inventorykey) as Total
from inventory_fact i join date_dim d on i.DateKey = d.Datekey
join cust_vendor_dim c on i.CustVendorKey = c.CustVendorKey 
where i.TransTypeKey = 5 and d.CalYear in (2011, 2012)
group by cube(c.Name,(d.CalYear,d.CalQuarter))
order by d.CalYear, d.CalQuarter, c.Name;