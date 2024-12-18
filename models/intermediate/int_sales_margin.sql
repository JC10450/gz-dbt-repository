-- int_sales_margin.sql

select
salesT.*
,purchase_price
,ROUND(salesT.quantity*productT.purchase_price,2) AS purchase_cost
,ROUND(salesT.revenue - salesT.quantity*productT.purchase_price,2) AS margin
from {{ ref('stg_raw__sales') }} AS salesT
LEFT JOIN {{ ref('stg_raw__product') }} AS productT
USING (products_id)