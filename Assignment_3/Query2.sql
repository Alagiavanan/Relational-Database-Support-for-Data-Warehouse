
--Query 2: Ranking within a partition

--Use the RANK function to rank customers in descending order by the sum of extended cost for shipments (transaction type 5). 
--You should partition the rank values by customer state. The result should include the customer state, customer name, sum of the extended cost, and rank. You should order the result by customer state.

select c.name,c.state, sum(i.extcost) as total, rank() over (partition by c.state order by sum(i.extcost) desc) as cust_rank
from inventory_fact i join cust_vendor_dim c 
on i.custvendorkey = c.custvendorkey
where i.transtypekey = 5
group by c.name, c.state
order by c.state;