SELECT
date_date
,COUNT(orders_id) as nb_transactions
,ROUND(SUM(revenue),0) as revenue
,ROUND(SUM(revenue)/COUNT(orders_id),1) as average_basket
,ROUND(SUM(margin),0) as margin
,ROUND(SUM(Operational_margin),0) as operational_margin
,ROUND(SUM(purchase_cost),0) as purchase_cost
,ROUND(SUM(logcost),0) as logcost
,ROUND(SUM(ship_cost),0) as ship_cost
,SUM(quantity) as quantity
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date desc