
--Query 6: Ratio to report applied to the entire result

--Calculate the ratio to report of the sum of extended cost for adjustments (transaction type 1). You should sort on descending order by sum of extended cost. 
--The result should contain the second item id, sum of extended cost, and ratio to report.

select m.seconditemid, sum(i.extcost) as total_cost, ratio_to_report(sum(i.extcost)) over() as ratio_to_report
from inventory_fact i join item_master_dim m 
on i.itemmasterkey = m.itemmasterkey
where i.transtypekey = 1
group by m.seconditemid
order by m.seconditemid desc;