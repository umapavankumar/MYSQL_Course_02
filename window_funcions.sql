SELECT
Maker,
Price,
RANK()
OVER (ORDER BY Price) as RankValue
FROM CAR_MAKERS;

SELECT
Maker,
ProductionYear,
Price,
RANK()
OVER (PARTITION BY ProductionYear ORDER BY Price)
as RankValue
FROM CAR_MAKERS;

SELECT
Maker,
ProductionYear,
Price,
DENSE_RANK()
OVER (PARTITION BY ProductionYear ORDER BY Price)
as DenseRankValue
FROM CAR_MAKERS;

SELECT
CountryName,
Continent,
ROW_NUMBER() OVER () as RowNumberValue
FROM COUNTRIES;

SELECT
Maker,
ProductionYear,
Price,
ROW_NUMBER()
OVER (PARTITION BY ProductionYear ORDER BY Price)
as RowNumberValue
FROM CAR_MAKERS;

SELECT
Maker,
ProductionYear,
Price,
PERCENT_RANK()
OVER (PARTITION BY ProductionYear ORDER BY Price)
as PercentValue
FROM CAR_MAKERS;

SELECT
Maker,
ProductionYear,
Price,
TotalCountrySales,
LEAD(TotalCountrySales, 1, 0)
OVER (PARTITION BY ProductionYear ORDER BY Price)
as LeadValue
FROM CAR_MAKERS cm JOIN COUNTRIES c
ON cm.Country = c.CountryID;

SELECT
Maker,
ProductionYear,
Price,
TotalCountrySales,
LEAD(TotalCountrySales , 1, 0)
OVER (PARTITION BY ProductionYear ORDER BY Price)
as LeadValue,
TotalCountrySales - (LEAD(TotalCountrySales , 1, 0)
OVER (PARTITION BY ProductionYear ORDER BY Price))
as Difference
FROM CAR_MAKERS cm JOIN COUNTRIES c
ON cm.Country = c.CountryID;

SELECT
Maker,
ProductionYear,
Price,
LEAD(TotalCountrySales, 3)
OVER (ORDER BY Price)
as LeadValue
FROM CAR_MAKERS cm JOIN COUNTRIES c
ON cm.Country = c.CountryID;

SELECT
Maker,
ProductionYear,
Price,
TotalCountrySales,
LAG(TotalCountrySales, 1, 0)
OVER (PARTITION BY ProductionYear ORDER BY Price)
as LagValue,
TotalCountrySales - (LAG(TotalCountrySales, 1, 0)
OVER (PARTITION BY ProductionYear ORDER BY Price))
as Difference
FROM CAR_MAKERS cm JOIN COUNTRIES c
ON cm.Country = c.CountryID;

SELECT
Maker,
ProductionYear,
Price,
TotalCountrySales,
FIRST_VALUE(TotalCountrySales)
OVER (PARTITION BY ProductionYear ORDER BY Price)
as FirstValue
FROM CAR_MAKERS cm JOIN COUNTRIES c
ON cm.Country = c.CountryID;

SELECT
Maker,
ProductionYear,
Country,
TotalCountrySales,
SUM(TotalCountrySales)
OVER (PARTITION BY ProductionYear) as SumValue,
COUNT(TotalCountrySales)
OVER (PARTITION BY ProductionYear) as CountValue,
AVG(TotalCountrySales)
OVER (PARTITION BY ProductionYear) as AvgValue
FROM CAR_MAKERS cm JOIN COUNTRIES c
ON cm.Country = c.CountryID;

SELECT
Maker,
ProductionYear,
NTILE(2)
OVER (PARTITION BY ProductionYear ORDER BY Maker)
as NtileValue
FROM CAR_MAKERS cm JOIN COUNTRIES c
ON cm.Country = c.CountryID;

SELECT
Maker,
ProductionYear,
Country,
TotalCountrySales,
CUME_DIST()
OVER (PARTITION BY ProductionYear ORDER BY TotalCountrySales) as CumeDistValue
FROM CAR_MAKERS cm JOIN COUNTRIES c
ON cm.Country = c.CountryID;