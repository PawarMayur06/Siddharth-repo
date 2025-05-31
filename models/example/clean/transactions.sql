-- models/clean/inv_transactions.sql
{{ config(
    tags=['inventory']
) }}
SELECT
    transaction_id,
    product_id,
    UPPER(TRIM(transaction_type)) as transaction_type,
    quantity,
    transaction_date,
    UPPER(TRIM(warehouse_location)) as warehouse_location
FROM {{ source('inventory', 'raw_inventory_transactions') }}
WHERE transaction_type IN ('RECEIPT', 'SHIPMENT')  -- Validate transaction types