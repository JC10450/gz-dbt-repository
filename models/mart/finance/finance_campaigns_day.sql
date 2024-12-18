--join int_campaigns_day model with finance_days
SELECT
CT.date_date
,DT.operational_margin-CT.ads_cost AS ads_margin
,DT.average_basket
,DT.operational_margin
,CT.ads_cost
,CT.ads_impression
,CT.ads_clicks
,DT.quantity
,DT.revenue
,DT.purchase_cost
,DT.margin
,DT.shipping_fee
,DT.logcost
,DT.ship_cost
from {{ ref('int_campaigns_day') }} AS CT
INNER JOIN {{ ref('finance_days') }} AS DT
USING (date_date)
ORDER BY date_date DESC