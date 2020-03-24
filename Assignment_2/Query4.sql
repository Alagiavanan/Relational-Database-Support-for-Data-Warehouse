
--4. Inventory Transactions by Transaction Description, Company, and Branch Plan

select c.CompanyName, b.BPName,t.TransDescription, sum(i.ExtCost) as TotalCost, count(i.InventoryKey)as Total
from inventory_fact i join branch_plant_dim b on i.BranchPlantKey = b.BranchPlantkey
join company_dim c on b.Companykey = c.Companykey 
join trans_type_dim t on i.TransTypeKey = t.TransTypeKey
group by grouping sets((t.TransDescription,c.CompanyName, b.BPName),(t.TransDescription,c.CompanyName), t.TransDescription,())
ORDER BY t.TransDescription, c.CompanyName, b.BPName;