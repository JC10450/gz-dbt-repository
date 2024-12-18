--int_orders_operational.sql

--Operational_margin = margin + shipping_fee - log_cost - ship_cost

select
marginT.orders_id,
marginT.date_date,
ROUND(marginT.margin+shipT.shipping_fee-shipT.logcost-shipT.ship_cost,2) AS operational_margin,
marginT.quantity,
marginT.revenue,
marginT.purchase_cost,
marginT.margin,
shipT.* EXCEPT (orders_id),
FROM {{ ref('int_orders_margin') }} AS marginT
LEFT JOIN {{ ref('stg_raw__ship') }} AS shipT
ON  marginT.orders_id = shipT. orders_id
ORDER BY marginT.orders_id DESC


