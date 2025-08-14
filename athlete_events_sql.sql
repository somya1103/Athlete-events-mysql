create schema athelete;
create database atheletedb;
use athelete;
select * from noc_regions;
select * from athlete_events;
select name,sex,age,height,weight,team from athlete_events where city = 'london';
select * from athlete_events;
select name,sex,age,height,weight,team from athlete_events where city = 'london' order by id , age;
select name,sex,age 
from athlete_events 
where medal= 'gold'
order by age
limit 50;

SET GLOBAL event_scheduler = ON;

select * from athlete_events;
#### problem
# basic inspection
select count(distinct name) from athlete_events;
select count(distinct team) from athlete_events;
select count(distinct noc) from athlete_events;
select count(distinct city) from athlete_events;
select count(distinct sport) from athlete_events;
select count(distinct medal) from athlete_events;

# main queries

select city,count(name) as cnt
from athlete_events 
where medal= 'gold'
group by city
order by cnt desc
limit 10;

select * from athlete_events;
select year, count(name) as cnt
from athlete_events
where medal <> 'na'
group by year
order by cnt desc
limit 3;

select year,count(name) as cnt
from athlete_events
where medal= 'gold'
group by year
order by cnt desc
limit 3;




select sex, count(name)
from athlete_events
where medal <> 'na'
group by sex
order by count(name) desc;

-- q1 sports with higher/lower number of athlete count
select sport,count(name) as cnt
from athlete_events
group by sport
order by cnt desc
limit 5;
select sport,count(name) as cnt
from athlete_events
group by sport
order by cnt 
limit 5;


-- q2 region with less number of athletes winning gold medal
select n.region , count(a.name) as cnt 
from athlete_events as a
inner join noc_regions as n
on a.noc= n.noc
where medal='gold'
group by n.region
order by cnt 
limit 10;

select* from athlete_events as a
inner join noc_regions as n
on a.noc=n.noc;

-- q3 city with highest athlete count in every region
select region, city, cnt ,rank_
from (select region,city,count(name) as cnt,
dense_rank() over ( partition by region order by count(name)  desc) as rank_
from athlete_events as a
inner join noc_regions	 as n
on a.noc=n.noc
group by region,city
order by count(name) desc
) as ranked_data
where rank_=1;

select region, city
from athlete_events as a
inner join noc_regions as n
on a.noc=n.noc
where city='london';

select * from athlete_events;
select * from noc_regions;

-- q4 Team with highest gold medal_count
select team, count(name) as count_
from athlete_events
where medal='gold'
group by team
order by count_ desc
limit 5;

select min(year) from athlete_events;
select max(year) from athlete_events;


---------------------------------------------------------------------------------------------
-- q5 Top 5 age with highest winning count
select count(name) from athlete_events where medal is not null;
select age,
count(name) as winning_count
from athlete_events
where medal <> 'na'
group by age
order by winning_count desc
limit 5;

-- q6 male/female medal count
select * from athlete_events;
select distinct(sex) as sex, count(name) as winning_count
from athlete_events
where Medal <> 'na'
group by sex 
order by winning_count desc;


-- q7 male-female athlete count
select distinct(sex) as sex, count(name) as athlete_count
from athlete_events
group by sex
order by athlete_count desc;



select * from athlete_events;

-- q8 Top 5 Region-wise gold,silver,bronze medal-count with highest total medal count
select region, 
sum(case when medal='gold' then 1 else 0 end) as gold_medal_count,
sum(case when medal='silver'then 1 else 0 end) as silver_medal_count,
sum( case when medal='bronze' then 1 else 0 end) as bronze_medal_count,
sum( case when medal <> 'na' then 1 else 0 end) as total_medal_count
from athlete_events as a
inner join noc_regions as n
on a.noc=n.noc
group by region
order by total_medal_count desc
limit 5;



-- q9 Age group with winning count(highest to lowest)

select min(age) from athlete_events;
select max(age) from athlete_events;

select 
case 
when age between 10 and 20 then '10-20'
when age between 21 and 30 then '21-30'
when age between 31 and 40 then '31-40' 
when age between 41 and 50 then '41-50'
when age between 51 and 60 then '51-60'
when age between 61 and 70 then '61-70' 
else '70+'
 end as  age_group, 
 count(name) as winning_count
 from athlete_events
 where medal <> 'na'
 group by age_group
 order by  winning_count desc;
 
-- q10 Top 5 athlete with highest medal count
select name, 
sum(case when medal = 'gold' then 1 else 0 end) as gold_medal,
sum(case when medal = 'silver' then 1 else 0 end) as silver_medal,
sum(case when medal = 'bronze' then 1 else 0 end) as bronze_medal,
sum(case when medal<> 'na' then 1 else 0 end) as total_count,
region
from athlete_events as a
inner join noc_regions as n
on a.noc= n.noc
group by name,region
order by total_count desc
limit 5;

-- q11 male vs female athlete count distribution country-wise
select * from athlete_events ;
select region,
sum( case when lower(sex) ='m' then 1 else 0 end) as Male_athlete_count,
sum( case when lower(sex) ='f' then 1 else 0 end) as Female_athlete_count,
sum( case when sex is not null then 1 else 0 end) as Total_athlete_count
from athlete_events as a
inner join noc_regions as n
on a.NOC=n.NOC
group by region
order by Total_athlete_count desc;

-- q12 sports-wise male female distribution 
select sport,
sum( case when lower(sex) ='m' then 1 else 0 end) as Male_athlete_count,
sum( case when lower(sex) ='f' then 1 else 0 end) as Female_athlete_count,
sum( case when sex is not null then 1 else 0 end) as Total_athlete_count
from athlete_events 
group by sport
order by Total_athlete_count desc;

-- q12 (b) female dominating sports 
select * from(
select sport,
sum( case when lower(sex) ='m' then 1 else 0 end) as Male_athlete_count,
sum( case when lower(sex) ='f' then 1 else 0 end) as Female_athlete_count,
sum( case when sex is not null then 1 else 0 end) as Total_athlete_count
from athlete_events 
group by sport
order by Total_athlete_count desc) as sex_dist
where female_athlete_count> male_athlete_count ;



select * from athlete_events;

-- q13 year wise count of event in summer and winter

select year,
sum( case when lower(season)='summer' then 1 else 0 end) as summer,
sum( case when lower(season)='winter' then 1 else 0 end) as winter,
sum(case when season is not null then 1 else 0 end) as Total
from athlete_events
group by year
order by year;

select * from athlete_events;

-- q14 Region wise sports with highest winning count

select region,sport,medal_count
from
(select region,sport,count(name) as medal_count,
dense_rank() over(partition by region order by count(name) desc) as rank_
from athlete_events as a
inner join noc_regions as n
on a.noc=n.noc
where medal <> 'na'
group by region,sport
order by medal_count desc) as table1
where rank_=1
order by medal_count desc;

-- we can check region wise sports ans medal_count
select region,sport,count(name) as medal_count
from athlete_events as a
inner join noc_regions as n
on a.noc=n.noc
where region='india' and medal <> 'na'
group by region,sport
order by medal_count desc;






















