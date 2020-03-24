
--7. Rewritten Query 3 without the ROLLUP or GROUPING SETS operators

select c.CompanyName, b.BPName, sum(i.ExtCost) as TotalCost, sum(i.Quantity) as Total
from inventory_fact i join branch_plant_dim b on i.BranchPlantKey = b.BranchPlantkey
join company_dim c on b.Companykey = c.Companykey 
where i.TransTypeKey = 2
group by c.CompanyName,b.BPName
UNION
select c.CompanyName, null, sum(i.ExtCost) as TotalCost, sum(i.Quantity) as Total
from inventory_fact i join branch_plant_dim b on i.BranchPlantKey = b.BranchPlantkey
join company_dim c on b.Companykey = c.Companykey 
where i.TransTypeKey = 2
group by c.CompanyName
UNION
select null, null, sum(i.ExtCost) as TotalCost, sum(i.Quantity) as Total
from inventory_fact i join branch_plant_dim b on i.BranchPlantKey = b.BranchPlantkey
join company_dim c on b.Companykey = c.Companykey 
where i.TransTypeKey = 2
