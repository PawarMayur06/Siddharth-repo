-- models/clean/inv_levels.sql
{{ config(
    tags=['inventory']
) }}
SELECT
    inventory_id,
    product_id,
    UPPER(TRIM(warehouse_location)) as warehouse_location,
    CASE WHEN quantity_on_hand < 0 THEN 0 ELSE quantity_on_hand END as quantity_on_hand,
    last_updated_at,
    minimum_stock_level,
    maximum_stock_level
FROM {{ source('inventory', 'raw_inventory_levels') }}