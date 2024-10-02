create database climate_change;
use climate_change;
select * from climate_change_impact_on_agriculture_2024
/*Calculate Average Crop Yield by Country and Crop Type */
/*Write a query to calculate the average crop yield (`Crop_Yield_MT_per_HA`) */
/*by `Country` and `Crop_Type` for each year.*/

SELECT Year, Country, Crop_Type, ROUND(AVG(Crop_Yield_MT_per_HA), 2) AS Avg_Crop_Yield_MT_per_HA
FROM climate_change_impact_on_agriculture_2024
GROUP BY Year, Country, Crop_Type;

/*Identify Countries with Extreme Weather Events*/
/*Write a query to list all `Country` and `Year` combinations*/
/*where there were one or more `Extreme_Weather_Events`.*/

select Country,Year
from climate_change_impact_on_agriculture_2024
where Extreme_Weather_Events >0;

/*Find Top 5 Countries by CO2 Emissions*/
/*Write a query to find the top 5 countries with the highest `CO2_Emissions_MT` in any given year.*/
 
SELECT Country, Year, CO2_Emissions_MT
FROM climate_change_impact_on_agriculture_2024
ORDER BY CO2_Emissions_MT DESC
LIMIT 5;

/*Calculate the Total Economic Impact of Extreme Weather Events per Region*/
/*Write a query to calculate the total `Economic_Impact_Million_USD` for regions (`Region`)*/
/* affected by extreme weather events*/

SELECT Region, ROUND(SUM(Economic_Impact_Million_USD),2) AS Total_Economic_Impact_Million_USD
FROM climate_change_impact_on_agriculture_2024
WHERE Extreme_Weather_Events > 0
GROUP BY Region;

/*List Countries with Irrigation Access Below 50%*/
/*Write a query to find all countries where `Irrigation_Access_%` was below 50% for any given year.*/

SELECT Country, Year, `Irrigation_Access_%`
FROM climate_change_impact_on_agriculture_2024
WHERE `Irrigation_Access_%` < 50;

/*Find the Year with the Highest Fertilizer Use in a Specific Country*/
/*Write a query to identify the year with the highest `Fertilizer_Use_KG_per_HA` in a given country.*/
 
SELECT Year, Country, MAX(Fertilizer_Use_KG_per_HA) AS Max_Fertilizer_Use_KG_per_HA
FROM climate_change_impact_on_agriculture_2024
WHERE Country = 'Brazil'
GROUP BY Year, Country
ORDER BY Max_Fertilizer_Use_KG_per_HA DESC
LIMIT 1;

/*Compare Average Temperatures by Region Over the Last 5 Years*/
/*Write a query to calculate the average `Average_Temperature_C` for each `Region` over the last 5 years in the dataset.*/
 
SELECT Region, ROUND(AVG(Average_Temperature_C),2) AS AVG_TEMP_OVER_FIVE_YEARS
FROM climate_change_impact_on_agriculture_2024
WHERE Year IN (
    SELECT Year
    FROM (
        SELECT DISTINCT Year
        FROM climate_change_impact_on_agriculture_2024
        ORDER BY Year DESC
        LIMIT 5
    ) AS LastFiveYears
)
GROUP BY Region;

/*Find Regions with Crop Yield Decline Despite Adaptation Strategies*/
/*Write a query to identify regions where `Crop_Yield_MT_per_HA` decreased*/
/*despite having at least one `Adaptation_Strategies` in place.*/

SELECT Region
FROM climate_change_impact_on_agriculture_2024
WHERE Adaptation_Strategies IS NOT NULL AND Adaptation_Strategies != ''
GROUP BY Region
HAVING MAX(Crop_Yield_MT_per_HA) > MIN(Crop_Yield_MT_per_HA);

/*Calculate the Total Pesticide and Fertilizer Use per Year for Each Country*/ 
/*Write a query to calculate the total `Pesticide_Use_KG_per_HA` and `Fertilizer_Use_KG_per_HA` for each `Country` per year.*/

SELECT Country, Year,
       ROUND(SUM(Pesticide_Use_KG_per_HA),2) AS Total_Pesticide_Use_KG_per_HA,
       ROUND(SUM(Fertilizer_Use_KG_per_HA),2) AS Total_Fertilizer_Use_KG_per_HA
FROM climate_change_impact_on_agriculture_2024
GROUP BY Country, Year;


/*Analyze the Relationship Between Precipitation and Crop Yield */
/*Write a query to investigate if there is a correlation */
/*between `Total_Precipitation_mm` and `Crop_Yield_MT_per_HA` across all countries and crop types.*/
/*--------------------------------------------S1------------------------------------------------------------------*/
SELECT 
    COUNT(*) AS n,
    ROUND(SUM(Total_Precipitation_mm),2) AS sum_x,
    ROUND(SUM(Crop_Yield_MT_per_HA),2) AS sum_y,
    ROUND(SUM(Total_Precipitation_mm * Crop_Yield_MT_per_HA),2) AS sum_xy,
    ROUND(SUM(Total_Precipitation_mm * Total_Precipitation_mm),2) AS sum_xx,
    ROUND(SUM(Crop_Yield_MT_per_HA * Crop_Yield_MT_per_HA),2) AS sum_yy
FROM climate_change_impact_on_agriculture_2024;
/*FINAL RESULTS FOR CORRELATION*/
/*------------------------------------------CONT S1------THE REASON WHY ELTON DOESNT STRESS ABOUT WORK--------------------------------------------------------------*/
SELECT  
        -- For Population
        (avg(x * y) - avg(x) * avg(y)) / 
        (sqrt(avg(x * x) - avg(x) * avg(x)) * sqrt(avg(y * y) - avg(y) * avg(y))) 
        AS correlation_coefficient_population,
        -- For Sample
        (count(*) * sum(x * y) - sum(x) * sum(y)) / 
        (sqrt(count(*) * sum(x * x) - sum(x) * sum(x)) * sqrt(count(*) * sum(y * y) - sum(y) * sum(y))) 
        AS correlation_coefficient_sample
    FROM climate_change_impact_on_agriculture_2024;
/*---------------------------------------------SOLUTION 2---------sIMPLE SOLUTION--------------------------------------------------------*/
SELECT 
    round((COUNT(*) * SUM(Total_Precipitation_mm * Crop_Yield_MT_per_HA) - SUM(Total_Precipitation_mm) * SUM(Crop_Yield_MT_per_HA)) /
    (SQRT(COUNT(*) * SUM(Total_Precipitation_mm * Total_Precipitation_mm) - SUM(Total_Precipitation_mm) * SUM(Total_Precipitation_mm)) * 
    SQRT(COUNT(*) * SUM(Crop_Yield_MT_per_HA * Crop_Yield_MT_per_HA) - SUM(Crop_Yield_MT_per_HA) * SUM(Crop_Yield_MT_per_HA)) 
    ),3)AS correlation_coefficient_sample
FROM climate_change_impact_on_agriculture_2024;


