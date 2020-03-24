
--Query 8: Cumulative distribution functions for carrying cost of all branch plants

--Calculate the rank, percent_rank, and cume_dist functions of the carrying cost in the branch_plant_dim table. The result should contain the BPName, CompanyKey, CarryingCost, rank, percent_rank, and cume_dist.

select BPName, CompanyKey, carryingcost, 
rank() over(order by carryingcost) as rank,
percent_rank() over(order by carryingcost) as percent_rank,
cume_dist() over(order by carryingcost) as cume_dist
from branch_plant_dim;

