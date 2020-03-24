
--Query 10: Cumulative distribution of extended cost for Colorado inventory

select distinct i.extcost, cume_dist() over(order by i.extcost) as cume_dist
from inventory_fact i join cust_vendor_dim c
on i.custvendorkey = c.custvendorkey
where c.state = 'CO'
order by i.extcost;