/*

Queries used for Tableau Project

*/


-- 1. 
-- GLOBAL NUMBERS
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
-- I take these out as they are not inluded in the above queries and want to stay consistent
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
-- Countries with Highest Infection Rate compared to Population
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











