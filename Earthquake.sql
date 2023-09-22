-- Group Financial Damage descriptions by year and type

with cte as (
	select 
		`Year`,
		case 
			when `Damage Description` = 1 then "1. Limited (roughly corresponding to less than $1 million)"
			when `Damage Description` = 2 then "2. Moderate (~$1 to $5 million)"
			when `Damage Description` = 3 then "3. Severe (~$5 to $25 million)"
			when `Damage Description` = 4 then "4. Extreme (~$25 million or more)"
		end as Damage_Type
	from `earthquake data`
    where `Damage Description` > 0
)

select
	cte.Damage_Type,
	cte.`Year`,
	count(cte.`Year`) as Occurances
from cte
group by cte.Damage_Type, cte.`Year`;

-- Group Housing damage descriptions by type and year

with cte as (
	select 
		`Year`,
		case 
			when `Total Houses Destroyed Description` = 1 then "1. Few (~1 to 50 houses)"
			when `Total Houses Destroyed Description` = 2 then "2. Some (~51 to 100 houses)"
			when `Total Houses Destroyed Description` = 3 then "3. Many (101 to 1000 houses)"
			when `Total Houses Destroyed Description` = 4 then "4. Very Many (~over 1000 houses)"
		end as House_Damage_Description
	from `earthquake data`
    where `Total Houses Destroyed Description` > 0
)

select
	cte.House_Damage_Description,
	cte.`Year`,
	count(cte.`Year`) as Occurrences
from cte
group by cte.House_Damage_Description, cte.`Year`;
