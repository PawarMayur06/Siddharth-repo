-- models/clean/inv_products.sql
{{ config(
    tags=['inventory']
) }}
SELECT
    product_id,
    TRIM(product_name) as product_name,
    TRIM(category) as category,
    CASE WHEN unit_price < 0 THEN NULL ELSE unit_price END as unit_price,
    in_stock
FROM {{ source('sales', 'raw_products') }}