-- EDA

select *
from layoffs_staging2;

select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

# companies that has 100% laid off, ordered by tot n° of laid off
select *
from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off desc;

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select min(`date`), max(`date`)
from layoffs_staging2;

select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;

select *
from layoffs_staging2;

# Total laid off for each month
select substring(`date`, 1, 7) as `Month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `Month`
order by 1 asc;

# Rolling laid off
with Rolling_total as
(
select substring(`date`, 1, 7) as `Month`, sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `Month`
order by 1 asc
)
select `Month`, total_off, sum(total_off) over(order by `Month`) as rolling_total
from Rolling_total;

-- top 5 companies tot laid off per year

# company laid off each year
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3 desc;

with Company_Year (company, years, tot_laid_off) as    # company laid off each year
(
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
), Company_Year_Rank as            # company laid off each year ranked
(
select *, 
dense_rank() over(partition by years order by tot_laid_off desc) as Ranking 
from Company_Year
where years is not null
)
select * 
from Company_Year_Rank
where Ranking <= 5
;