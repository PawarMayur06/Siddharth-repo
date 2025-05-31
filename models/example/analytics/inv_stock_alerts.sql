-- models/analytics/inv_stock_alerts.sql
{{ config(
    tags=['inventory']
) }}
SELECT
    product_id,
    product_name,
    warehouse_location,
    quantity_on_hand,
    minimum_stock_level,
    maximum_stock_level,
    CASE
        WHEN quantity_on_hand <= minimum_stock_level THEN 'REORDER'
        WHEN quantity_on_hand >= maximum_stock_level THEN 'OVERSTOCKED'
        WHEN quantity_on_hand <= minimum_stock_level * 1.2 THEN 'LOW_STOCK'
        ELSE 'OPTIMAL'
    END as stock_status,
    total_receipts,
    total_shipments,
    ROUND(total_shipments::FLOAT / NULLIF(total_receipts, 0) * 100, 2) as inventory_turnover_rate
FROM {{ ref('inv_stock_summary') }}