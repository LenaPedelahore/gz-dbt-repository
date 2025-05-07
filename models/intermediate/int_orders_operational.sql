SELECT 
o_margin.orders_id
,o_margin.date_date
,ROUND(o_margin.margin + ship.shipping_fee - ship.logcost - ship.ship_cost) as Operational_margin
,o_margin.quantity
,o_margin.revenue
,o_margin.purchase_cost
,o_margin.margin
,ship.shipping_fee
,ship.logcost
,ship.ship_cost
FROM {{ref("int_orders_margin")}} as o_margin
LEFT JOIN {{ref("stg_raw__ship")}} as ship
USING(orders_id)
ORDER BY orders_id desc
