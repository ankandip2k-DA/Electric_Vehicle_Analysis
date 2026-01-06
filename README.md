# # ⚡ Electric Vehicle Analytics  
### *Performance, Cost & Sustainability Insights*

The global shift toward electric mobility has created a strong need for **data-driven insights** to evaluate the performance, cost, and sustainability of electric vehicles.  
Fleet operators, manufacturers, and individual buyers require comprehensive analytics to make informed decisions.

**Author:** Ankandip Sen  
TOOL - MySQL

---

## 🎯 Key Stakeholders & Their Needs

### 🚛 Fleet Operators
- Optimize vehicle selection for operational efficiency  
- Control maintenance costs  
- Plan maintenance schedules across large fleets  

### 🏭 EV Manufacturers
- Benchmark vehicle performance  
- Conduct competitive and market analysis  
- Guide product development and positioning strategies  

### 🚗 Individual Buyers
- Compare total cost of ownership  
- Evaluate reliability and long-term value retention  
- Make informed personal purchase decisions  

---

## 🗄️ Database Foundation

A comprehensive **Electric Vehicle database** containing:
- Performance metrics  
- Cost data  
- Environmental impact measurements  
- Multiple manufacturers and vehicle types  

```sql
CREATE DATABASE Project;
USE Project;
SELECT * FROM Electric_Vehicle;
Electric_Vehicle_Analysis
🔋 Battery & Range Analysis
Key Metrics

Average battery capacity and range vary significantly by vehicle type

Battery health below 80% shows noticeable range degradation

Example Analysis
SELECT 
    vehicle_type,
    AVG(battery_capacity_kWh) AS avg_battery,
    AVG(range_km) AS avg_range
FROM Electric_Vehicle
GROUP BY vehicle_type;

⚡ Energy Efficiency Insights

Identified top-performing vehicles based on range per kWh

Ranked manufacturers by charging speed

Flagged inefficient vehicles exceeding fleet energy consumption averages

🚙 Mileage & Longevity Analysis

Vehicles exceeding 100,000 km mileage were compared against fleet-average resale values

Identified manufacturing years with the best resale value retention

🌱 Environmental Impact

Calculated total CO₂ emissions saved across all vehicles

Ranked vehicles by CO₂ savings efficiency per kilometer

SELECT 
    make,
    model,
    SUM(CO2_Saved_tons) AS total_CO2_saving
FROM Electric_Vehicle
GROUP BY make, model;

💰 Cost Analysis & Ownership Ranking

Average maintenance cost by vehicle type

Identified bad investment vehicles where maintenance exceeds resale value

Ranked vehicles by total cost of ownership

📈 Trends & Comparative Rankings

Analyzed range improvements across manufacturing years

Ranked top 3 vehicles by range within each vehicle category

🔍 Key Insights

Premium EVs offer higher resale value and efficiency

Battery health has a direct impact on usable range

Energy-efficient vehicles significantly reduce long-term operating costs

Environmental benefits increase proportionally with mileage

💡 Business Recommendations
For Fleet Operators

Prioritize vehicles with proven high-mileage performance

Monitor battery health metrics proactively

Align vehicle choice with charging infrastructure capabilities

For Manufacturers

Invest in battery longevity and fast-charging technology

Focus on improving energy efficiency per kilometer

Use analytics-driven benchmarking for product development

🛠️ Tools & Technologies

SQL (Window Functions, CTEs, Aggregations)

Relational Database Systems

Analytical Query Design

🚀 Future Enhancements

Integration with Power BI dashboards

Predictive modeling for battery degradation

AI-based resale value forecasting

Regional and climate-based performance analysis

🙌 Conclusion

This project demonstrates how SQL-driven analytics can transform raw EV data into meaningful insights that improve cost efficiency, sustainability, and strategic planning in electric mobility
