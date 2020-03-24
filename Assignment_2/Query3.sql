
--3. Transfers by Company and Branch Plant

select c.CompanyName, b.BPName, sum(i.ExtCost) as TotalCost, sum(i.Quantity) as Total
from inventory_fact i join branch_plant_dim b on i.BranchPlantKey = b.BranchPlantkey
join company_dim c on b.Companykey = c.Companykey 
where i.TransTypeKey = 2
group by rollup(c.CompanyName,b.BPName)
order by c.CompanyName, b.BPName;