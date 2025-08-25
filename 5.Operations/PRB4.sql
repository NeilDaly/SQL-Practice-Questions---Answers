/*
    In the invoices_fact table, each activity has a base cost calculated as hours_spent * hours_rate. Assume a flat travel fee of $150 is charged per activity.

    Add this flat fee to the base cost, and name the resulting column total_cost_with_travel.
    Return the activity_id and total_cost_with_travel, ordered by activity_id in ascending order.
*/

SELECT
    activity_id,
    (hours_spent * hours_rate) + 150 AS total_cost_with_travel
FROM
    invoices_fact
ORDER BY
    activity_id