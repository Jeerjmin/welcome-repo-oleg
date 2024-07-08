<<<<<<< HEAD

-- File: cltv_calculation.sql
-- This SQL script calculates the Customer Lifetime Value (CLTV) for each customer.

-- Step 1: Calculate Total Revenue per Customer
WITH total_revenue_per_customer AS (
    SELECT 
        o.user_id,
        SUM(oi.sale_price * oi.sale_quantity) AS total_revenue
    FROM 
        public.orders o
    JOIN 
        public.order_items oi ON o.id = oi.order_id
    GROUP BY 
        o.user_id
),

-- Step 2: Calculate Customer Lifespan
customer_lifespan AS (
    SELECT 
        user_id,
        DATEDIFF(day, MIN(created_at), MAX(created_at)) AS customer_lifespan
    FROM 
        public.orders
    GROUP BY 
        user_id
)

-- Step 3: Combine to Calculate CLTV
SELECT 
    tr.user_id,
    tr.total_revenue / cl.customer_lifespan AS cltv
FROM 
    total_revenue_per_customer tr
JOIN 
    customer_lifespan cl ON tr.user_id = cl.user_id;
=======
SELECT
  *
FROM (
  SELECT
    author,
    COUNT(*) AS num_stories
  FROM hackernews.stories
  GROUP BY author
  ORDER BY num_stories DESC
  LIMIT 10
)
>>>>>>> refs/remotes/origin/main
