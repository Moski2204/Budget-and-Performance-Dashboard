
with Project_Status as (
SELECT 
project_id,
project_name,
project_budget,
'upcoming' as Status -- Creates a new column to show which columns are upcoming
FROM upcoming_projects
UNION ALL
SELECT 
project_id,
project_name,
project_budget,
'completed' as Status -- Creates a new column to show which columns are completed
FROM completed_projects)


SELECT 
e.employee_id, e.first_name, e.last_name, e.job_title, e.salary, d.Department_Name, pa.employee_id,
CTE.project_name, CTE.status
FROM employees AS e -- Alias 
JOIN departments AS d -- Alias
on e.department_id = d.Department_ID -- Joining employees D.I.D with departments D.I.D
JOIN project_assignments AS pa
ON pa.employee_id = e.employee_id
JOIN Project_Status AS CTE
on CTE.project_id = pa.project_id;-- FOURTH WE DID HERE, we are joining the project_status to the Big table now, THROUGH the CTE we made





