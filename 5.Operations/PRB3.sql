/*
    In the invoices_fact table, suppose each project has a fixed budget cap. You’re told the budget cap is $100,000 for every activity.

    Subtract the actual cost of the activity (calculated as hours_spent * hours_rate) from the budget cap to find how much budget is left. Name this new column remaining_budget.

    Return the activity_id and remaining_budget, and order the results by activity_id in ascending order.
*/

SELECT
    activity_id,
    100000 - (hours_spent * hours_rate) AS remaining_budget
FROM
    invoices_fact
ORDER BY
    activity_id