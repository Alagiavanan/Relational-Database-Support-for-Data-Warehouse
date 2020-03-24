
  
--Query 5: Cumulative extended costs for a partition

--Calculate the cumulative sum of extended cost ordered by customer zip code, calendar year, and calendar month for shipments (transaction type 5). 
--Restart the cumulative extended cost after each combination of zip code and calendar year. 
--The result should include the customer zip code, calendar year, calendar month, sum of the extended cost, and cumulative sum of the extended cost. 
--Note that the cumulative extended cost is the sum of the extended cost in the current row plus the cumulative sum of extended costs in all previous rows of the store zip code and years. 
--The value of cumulative extended cost resets in each partition (new value for zip code and year).

select c.zip, d.calyear, d.calmonth , sum(i.extcost) as total_cost, sum(sum(i.extcost)) OVER (Partition By c.zip, d.calyear ORDER BY ZIP, CALYEAR, CALMONTH ROWS UNBOUNDED PRECEDING )as cum_total_cost
from inventory_fact i join cust_vendor_dim c on i.custvendorkey = c.custvendorkey
join date_dim d on i.datekey = d.datekey
where i.transtypekey = 5
group by c.zip, d.calyear, d.calmonth 
order by c.zip, d.calyear, d.calmonth;