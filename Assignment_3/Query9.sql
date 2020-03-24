
--Query 9: Determine worst performing plants

--Determine the branch plants with the highest carrying costs (top 15%). The result should contain BPName, CompanyKey, CarryingCost, and cume_dist.

select * from
(select BPName, CompanyKey, carryingcost, 
cume_dist() over(order by carryingcost) as cume_dist
from branch_plant_dim)
where cume_dist >=0.85;