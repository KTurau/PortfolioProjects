/*

Queries used for Tableau Project

*/


-- 1. 
-- Global Numbers
Select 
	SUM(new_cases) as total_cases, 
	SUM(cast(new_deaths as int)) as total_deaths, 
	SUM(cast(new_deaths as int))/SUM(New_Cases) * 100 as DeathPercentageGlobal
From CovidDeaths
--Where location like '%belarus%'
Where continent is not null 
--Group By date
Order By 1,2;


-- 2. 
-- Total Death Count per Continent
-- European Union is part of Europe
Select 
	location, 
	SUM(cast(new_deaths as int)) as TotalDeathCount
From CovidDeaths
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group By location
Order By TotalDeathCount Desc;


-- 3.
-- Total Infection by Country
Select 
	location, 
	population, 
	MAX(total_cases) as HighestInfectionCount,  
	MAX((total_cases/population)) * 100 as PercentPopulationInfected
From CovidDeaths
--Where location like '%belarus%'
Group By location, population
Order By PercentPopulationInfected Desc;


-- 4.
--Percent Population Infected
Select 
	location, 
	population,
	date, 
	MAX(total_cases) as HighestInfectionCount,  
	MAX((total_cases/population)) * 100 as PercentPopulationInfected
From CovidDeaths
--Where location like '%states%'
Group By location, population, date
Order By PercentPopulationInfected Desc;











