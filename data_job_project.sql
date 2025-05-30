-- 1.	How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
	FROM data_analyst_jobs;

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT *
	FROM data_analyst_jobs
		ORDER BY company 
LIMIT 10;

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT(title), location
	FROM data_analyst_jobs
		WHERE location IN ('TN', 'KY')
	GROUP BY location;

-- CHECK!!!
-- 4.	How many postings in Tennessee have a star rating above 4?
SELECT title, location, star_rating
	FROM data_analyst_jobs
		WHERE location = 'TN' 
			AND star_rating >= 4;
-- 4, How to aggregate into single value?

-- CHECK!!!
-- 5.	How many postings in the dataset have a review count between 500 and 1000?
SELECT title, review_count
	FROM data_analyst_jobs
		WHERE review_count BETWEEN 500 AND 1000;
-- 151, How to aggregate into single value?

-- CHECK!!!
-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`.
-- Which state shows the highest average rating?
SELECT ROUND(star_rating, 1) AS avg_rating, company, location AS state
	FROM data_analyst_jobs
		WHERE star_rating IS NOT NULL
	GROUP BY star_rating, company, location
	ORDER BY location ASC, star_rating DESC;
-- CA
-- Take each 'state', average the ratings across each posting per state, show that list of states and average post rating?

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT title)
	FROM data_analyst_jobs;

-- HELP!!!
-- 8.	How many unique job titles are there for California companies?
SELECT DISTINCT (title), location
	FROM data_analyst_jobs
		WHERE location = 'CA';
-- 230, Count these titles? COUNT, then SUM?

-- HELP!!!
-- 9.	Find the name of each company and its (that company's) average star rating for all companies (those companies) that have more than 
-- 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT DISTINCT (company), ROUND(star_rating, 1), review_count, location
	FROM data_analyst_jobs
		WHERE star_rating IS NOT NULL
			AND company IS NOT NULL
			AND review_count > 5000
	GROUP by company, star_rating, review_count, location
		HAVING(COUNT(location) > 1)
-- Still showing companies with 1 entry?
	ORDER BY company;
-- 8, Count up companies that fit these parameters?

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. 
-- Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT DISTINCT (company), ROUND(star_rating, 1), review_count, location
	FROM data_analyst_jobs
		WHERE star_rating IS NOT NULL
			AND company IS NOT NULL
			AND review_count > 5000
		GROUP by company, star_rating, review_count, location
			HAVING(COUNT(location) >= 2 )
		ORDER BY ROUND(star_rating, 1) DESC;

-- CHECK!!!
-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
SELECT COUNT(DISTINCT(title))
	FROM data_analyst_jobs
		WHERE title LIKE '%Analyst%';
-- What about 'analyst' or 'ANALYST'?

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT DISTINCT(title)
	FROM data_analyst_jobs
		WHERE title NOT LIKE '%Analyst%'
			AND title NOT LIKE '%Analytics%';
-- Contains specialist, developer, case sensitive postings