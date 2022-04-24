-- Deliverable 1: The Number of Retiring Employees by Title
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
INTO retirement_titles
FROM employees AS e
	INNER JOIN titles AS tt
	ON (e.emp_no = tt.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	ORDER BY e.emp_no;

/*
rteirement_titles holds soon to retire employees' info and job titles (both previous and current),
based on their birth date ordered by employee no.
*/

SELECT DISTINCT ON (rt.emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
	ORDER BY 
	rt.emp_no ASC,
	rt.to_date DESC;

/*
unique_titles is extracted from retirement_titles.
It holds soon to retire employees' info and current job titles (if they are stil working).
*/


SELECT COUNT (ut.title) AS title_count,
	ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY title_count DESC;
-- SELECT COUNT AS: 
-- https://kb.objectrocket.com/postgresql/how-to-use-the-postgres-count-select-1386
/*
retiring_titles was extracted from uniques_titles.
It holds the number of soon to retire employees for each job title.
*/


-- Deliverable 2: The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_eligibilty
FROM employees AS e
	INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
	
	INNER JOIN titles AS tt
	ON (e.emp_no = tt.emp_no)
	
	WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND de.to_date = '9999-01-01'
ORDER by e.emp_no;

-- Deliverable 3: More tables
-- Table 1: Eligible Mentorship Titles Count
SELECT COUNT (me.title) AS me_title_count,
	me.title
INTO mentorship_titles
FROM mentorship_eligibilty AS me
GROUP BY me.title
ORDER BY me_title_count DESC;


-- Table 2: Ratio of Open Positions to Eligible Mentors

-- Join retiring_titles and mentorship titles
SELECT rt. title,
	rt.title_count AS open_positions,
	mt.me_title_count AS mentor_count
INTO joined_count
FROM retiring_titles AS rt
FULL OUTER JOIN mentorship_titles AS mt
ON (rt.title = mt.title)
ORDER BY rt.title_count DESC;


-- Calculate ratio of soon to be open positions to number of mentors available for every title 
SELECT *, 
	FLOOR((CAST(open_positions AS FLOAT) / CAST(mentor_count AS FLOAT))) AS open_to_mentor 
	--https://postgresqlhero.com/divide-two-columns-in-postgresql/
INTO ratio
FROM joined_count
ORDER BY open_to_mentor DESC;

-- Table 3: Title by department count
-- Get department name 
SELECT ut.*,
	d.dept_name
INTO retiring_dept
FROM unique_titles AS ut
	INNER JOIN dept_emp AS de
	ON (ut.emp_no = de.emp_no)
	
	INNER JOIN departments AS d
	ON (de.dept_no = d.dept_no)
WHERE de.to_date = '9999-01-01';

-- Get department and title count
SELECT rd.dept_name,
	rd.title,
	COUNT (rd.title) AS rdcount
INTO retiring_dept_count
FROM retiring_dept AS rd
GROUP BY rd.dept_name, rd.title
ORDER BY rd.dept_name, rd.title;


/*
-- Create a pivot table did not work; ask for help

CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT *
FROM crosstab('select dept_name, title, rdcount from retiring_dept_count order by 1, 2')
	AS ct (Department varchar, Title varchar, TCount INT);
-- https://stackoverflow.com/questions/3002499/postgresql-crosstab-query/11751905#11751905
-- https://www.postgresql.org/docs/current/tablefunc.html
-- https://learnsql.com/blog/creating-pivot-tables-in-postgresql-using-the-crosstab-function/
-- https://ubiq.co/database-blog/create-pivot-table-postgresql/
*/