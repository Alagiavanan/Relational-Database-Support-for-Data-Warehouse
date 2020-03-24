
--Query 1: Ranking within the entire result

--Use the RANK function to rank customers in descending order by the sum of extended cost for shipments (transaction type 5). 
--You should use the entire result as a single partition. The result should include the customer name, sum of the extended cost, and rank.

select c.name, sum(i.extcost) as total, rank() over (order by sum(i.extcost) desc) as cust_rank
from inventory_fact i join cust_vendor_dim c 
on i.custvendorkey = c.custvendorkey
where i.transtypekey = 5
group by c.name;