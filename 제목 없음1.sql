SELECT employee_id, first_name, salary
 		FROM employees
 		WHERE lower(first_name) LIKE '%eve%'
 		ORDER BY employee_id;