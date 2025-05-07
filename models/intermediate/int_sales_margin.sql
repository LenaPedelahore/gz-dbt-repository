SELECT products_id,
      date_date,
      orders_id,
      revenue,
      quantity,
      purchase_price,
   -- Calcul du coût d'achat
sales.quantity * product.purchase_price AS purchase_cost,

    -- Calcul de la marge
sales.revenue - (sales.quantity * product.purchase_price) AS margin
FROM {{ ref ('stg_raw__sales')}} AS sales
LEFT JOIN {{ ref ('stg_raw__product')}} AS product
    ON sales.pdt_id = product.products_id
