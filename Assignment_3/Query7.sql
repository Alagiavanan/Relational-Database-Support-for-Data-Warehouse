
--Query 7: Ratio to report applied to a partition

--Calculate the ratio to report of the sum of extended cost for adjustments (transaction type 1) with partitioning on calendar year.
--You should sort on ascending order by calendar year and descending order by sum of extended cost.
--The result should contain the calendar year, second item id, sum of extended cost, and ratio to report.

select d.calyear, m.seconditemid, sum(i.extcost) as total_cost, ratio_to_report(sum(i.extcost)) over(partition by d.calyear) as ratio_to_report
from inventory_fact i join item_master_dim m on i.itemmasterkey = m.itemmasterkey 
join date_dim d on d.datekey = i.datekey
where i.transtypekey = 1
group by d.calyear,m.seconditemid
order by d.calyear asc, total_cost desc;