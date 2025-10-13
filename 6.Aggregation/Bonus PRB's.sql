/*
    Calculate the total earnings per project
    Calculate a scenario where the hourly rate increases by $5
*/

SELECT
    project_id,
    SUM(hours_spent * hours_rate) AS project_original_cost,
    SUM(hours_spent * (hourly_rate + 5)) AS project_projected_cost
FROM
    invoices_fact
GROUP BY
    project_id