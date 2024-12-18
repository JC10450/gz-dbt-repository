--int_orders_margin.sql

select
orders_id,
date_date,
ROUND(sum(revenue),2) AS revenue,
ROUND(sum(quantity),2) AS quantity,
ROUND(sum(purchase_cost),2) AS purchase_cost,
ROUND(sum(margin),2) AS margin
from {{ ref('int_sales_margin') }}
GROUP BY 
orders_id,
date_date
ORDER BY orders_id DESC