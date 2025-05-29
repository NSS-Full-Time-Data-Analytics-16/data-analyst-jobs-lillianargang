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

-- 4.	How many postings in Tennessee have a star rating above 4?
SELECT COUNT(title), location, star_rating
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4
GROUP BY location, star_rating;
-- Why have to add GROUP BY?
-- How to aggregate into single value?

-- 5.	How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(title), review_count
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000
GROUP BY title, review_count;
-- 131, How to aggregate into single value?

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`.
-- Which state shows the highest average rating?
SELECT ROUND(AVG(star_rating),1) AS avg_rating, company, location AS state
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY star_rating, company, location
ORDER BY star_rating DESC, location ASC;
-- Need to make company DISTINCT? Or aggregate all company ratings?
-- How to show me which state has highest average rating? (MAX?)

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

-- 8.	How many unique job titles are there for California companies?

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?