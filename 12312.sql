WITH customer_ltv AS (
      SELECT
        user_id,
        SUM(sale_price) AS total_revenue,
        SUM(sale_price * 0.5) AS total_cost
      FROM orders
      GROUP BY 1
    )
    SELECT
      u.id AS user_id,
      u.first_name,
      u.last_name,
      u.email,
      u.created_at AS user_created_at,
      SUM(oi.sale_price) AS total_revenue,
      SUM(oi.sale_price * 0.5) AS total_cost,
      SUM(oi.sale_price) - SUM(oi.sale_price * 0.5) AS total_profit,
      SUM(oi.sale_price) - SUM(oi.sale_price * 0.5) - SUM(oi.sale_price * 0.1) AS total_profit_after_ad_costs
    FROM users u
    JOIN orders o ON u.id = o.user_id
    JOIN order_items oi ON o.id = oi.order_id
    JOIN customer_ltv cl ON u.id = cl.user_id
    GROUP BY 1, 2, 3, 4, 5
    ORDER BY 6 DESC