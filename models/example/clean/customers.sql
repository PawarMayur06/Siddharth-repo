-- models/clean/sales_customers.sql
{{ config(
    tags=['sales']
) }}
SELECT
    customer_id,
    TRIM(first_name) as first_name,
    TRIM(last_name) as last_name,
    LOWER(TRIM(email)) as email,
    UPPER(TRIM(country)) as country,
    created_date
FROM {{ source('sales', 'raw_customers') }}