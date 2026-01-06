create database Project;
select* from Electric_Vehicle;
use Project;

ALTER TABLE electric_vehicle
RENAME COLUMN `Battery_Health_%` TO Battery_Health_Percent;


-- 1.Find the average battery capacity and average range of cars by Vehicle_Type.
select vehicle_type, avg(battery_capacity_kWh) as avg_battery_capacity,avg(range_km) as avg_rng
from Electric_Vehicle
group by Vehicle_Type;


-- 2. Identify the top 5 vehicles with the best range per kWh of battery (efficiency).

select make, count(battery_capacity_kWh) as top_5_battery_effiency
from Electric_Vehicle
group by make order by top_5_battery_effiency desc limit 5;

-- 3. List all cars where Battery_Health_% < 80 and show how much their Range_km is below the fleet average.
SELECT 
    Vehicle_ID,
    Make,
    Model,
    Year,
    Battery_Health_Percent,
    Range_km,
    ROUND((Range_km - AVG(Range_km) OVER()), 2) AS Range_vs_Avg
FROM Electric_Vehicle
WHERE Battery_Health_Percent < 80
ORDER BY Range_vs_Avg ASC;	



 
 -- 4. Find the average charging time per Make and rank manufacturers from fastest to slowest charging
select make,model,
avg(charging_time_hr) over(partition by make,model order by charging_time_hr desc) as charging_hrs,
rank() over(order by charging_time_hr asc) as rank_charging
from Electric_Vehicle;

-- 5. Show the top 3 cars with the highest number of Charge_Cycles (most used cars).
select model, Charge_Cycles
from Electric_Vehicle
order by Charge_Cycles desc limit 3;

-- 6. Find cars where Energy_Consumption_kWh_per_100km > fleet average (inefficient models).

select Model, Energy_Consumption_kWh_per_100km
from Electric_Vehicle
where Energy_Consumption_kWh_per_100km > 
      (select avg(Energy_Consumption_kWh_per_100km)
       from Electric_Vehicle);



-- 7. Identify cars with Mileage_km > 100,000 and check their Resale_Value_USD compared to fleet average.
with Mileage_Analysis as(
select Make,Model,Mileage_km,Resale_Value_USD,
avg(Resale_Value_USD)over() as avg_resale_value
from Electric_Vehicle
where Mileage_km > 100000)
SELECT 
    Make,
    Model,
    Mileage_km,
    Resale_Value_USD,
    avg_resale_value,
    (Resale_Value_USD - avg_resale_value) AS compare
FROM Mileage_analysis;

-- 8. Calculate the average resale value per manufacturing year  — which year retains the best value?
            SELECT 
    Year,
    ROUND(AVG(Resale_Value_USD), 2) AS Avg_Resale_Value
FROM Electric_Vehicle
GROUP BY Year
ORDER BY Avg_Resale_Value DESC;

-- 9. Find the total CO2 saved by all vehicles 
select make,model,sum(CO2_Saved_tons) as total_CO2_saveing
from Electric_Vehicle
group by make, model;

-- 10. Identify the top 5 cars with the highest CO2 savings per Mileage_km (eco-efficiency).
select 
make,
model,
CO2_Saved_tons,
Mileage_km
from Electric_Vehicle
order by CO2_Saved_tons desc
limit 5;

-- 11. Calculate the average maintenance cost per Vehicle_Type

select avg(Maintenance_Cost_USD), Vehicle_Type
from Electric_Vehicle
group by Vehicle_Type;


-- 12. Find cars where Resale_Value_USD < Maintenance_Cost_USD (bad investment).
WITH CTE_COST AS (
SELECT Make, Model, SUM(Resale_Value_USD) AS RV, SUM(Maintenance_Cost_USD) AS MC
FROM Electric_Vehicle
GROUP BY MAKE, MODEL
)
SELECT MAKE, MODEL, RV, MC
FROM CTE_COST
WHERE RV < MC;

-- 13. Rank cars by cost of ownership and return the cheapest models.
select make,model,
(Maintenance_Cost_USD + (Charge_Cycles * Energy_Consumption_kWh_per_100km)) as cost_of_ownership
from Electric_Vehicle
order by cost_of_ownership asc;


-- 14. Compare Range_km trends across Year — is the range improving in newer models ?
select year, model, avg(Range_km) as avg_km
from Electric_Vehicle
group by year, model
order by year asc;

-- 15. For each Vehicle_Type, rank cars by Range_km and return the top 3 per type.
select Vehicle_Type, Range_km, Model,
rank() over(order by Range_km desc) as rnk_range
from Electric_Vehicle
limit 3 ;

       
 
































 
  


        









