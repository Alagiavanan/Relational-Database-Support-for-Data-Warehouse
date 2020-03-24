
--Query 3: Ranking and dense ranking within the entire result

--Use both RANK and DENSE_RANK functions to rank customers in descending order by the count of inventory transactions for shipments (transaction type 5). 
--You should use the entire result as a single partition. 
--The result should include the customer name, count of transactions, rank, and dense rank.

select c.name, count(i.transtypekey), rank() over( order by count(i.transtypekey) desc) as cust_rank, dense_rank() over( order by count(i.transtypekey) desc) as cust_dense_rank
from inventory_fact i join cust_vendor_dim c 
on i.custvendorkey = c.custvendorkey
where i.transtypekey = 5
group by c.name;