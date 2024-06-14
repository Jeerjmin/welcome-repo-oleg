SELECT
  *
FROM (
  SELECT
    T1.id AS order_id,
    T1.user_id AS user_id,
    T2.name AS product_name,
    T2.id AS product_id,
    T2.category AS product_category,
    T2.subcategory AS product_subcategory,
    T2.brand AS product_brand,
    T2.color AS product_color,
    T2.size AS product_size,
    T2.material AS product_material,
    T2.weight AS product_weight,
    T2.sku AS product_sku,
    T2.department AS product_department,
    T2.id AS inventory_item_id,
    T2.cost AS inventory_item_cost,
    T2.quantity AS inventory_item_quantity,
    T2.distribution_center_id AS distribution_center_id,
    T2.created_at AS inventory_item_created_at,
    T2.id AS order_item_id,
    T2.sale_price AS order_item_sale_price,
    T2.sale_quantity AS order_item_sale_quantity,
    T2.shipped_at AS order_item_shipped_at,
    T2.delivered_at AS order_item_delivered_at,
    T2.returned_at AS order_item_returned_at,
    T2.status AS order_item_status
  FROM public.orders AS T1
  INNER JOIN public.order_items AS T2
    ON T1.id = T2.order_id
  WHERE T1.status = 'delivered'
  ORDER BY T1.id, T2.id
) AS T
GROUP BY
  T.order_id,
  T.user_id,
  T.product_name,
  T.product_id,
  T.product_category,
  T.product_subcategory,
  T.product_brand,
  T.product_color,
  T.product_size,
  T.product_material,
  T.product_weight,
  T.product_sku,
  T.product_department,
  T.inventory_item_id,
  T.inventory_item_cost,
  T.inventory_item_quantity,
  T.distribution_center_id,
  T.inventory_item_created_at,
  T.order_item_id,
  T.order_item_sale_price,
  T.order_item_sale_quantity,
  T.order_item_shipped_at,
  T.order_item_delivered_at,
  T.order_item_returned_at,
  T.order_item_status