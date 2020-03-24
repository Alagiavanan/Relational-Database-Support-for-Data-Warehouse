
--2. Sales Order Shipments by Name, Zip, and Quarter

Select d.CalQuarter, c.zip, c.Name , sum(i.ExtCost) as TotalCost, count(i.Inventorykey) as Total
from inventory_fact i join date_dim d on i.DateKey = d.Datekey
join cust_vendor_dim c on i.CustVendorKey = c.CustVendorKey 
where i.TransTypeKey = 5 and d.CalYear in (2011, 2012)
group by grouping sets(d.CalQuarter, c.zip, c.Name, (d.CalQuarter,c.zip), (d.CalQuarter,c.Name), (c.zip,c.Name),(d.CalQuarter,c.zip,c.Name),())
order by d.CalQuarter, c.zip, c.Name;