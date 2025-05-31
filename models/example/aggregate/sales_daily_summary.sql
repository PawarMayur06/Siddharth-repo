-- models/aggregate/sales_daily_summary.sql
{{ config(
    tags=['sales']
) }}
SELECT
    order_date,
    COUNT(DISTINCT order_id) as total_orders,
    COUNT(DISTINCT customer_id) as unique_customers,
    SUM(quantity) as total_items_sold,
    SUM(amount) as total_revenue
FROM {{ ref('orders') }}
GROUP BY order_date