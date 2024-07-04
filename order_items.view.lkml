
# products.view.lkml
measure: count {
  type: count
  drill_fields: [id, name, department, category, subcategory, brand, size, weight, color, material, sku, user_order_facts.total_orders, user_order_facts.total_spent]
}

# users.view.lkml
measure: count {
  type: count
  drill_fields: [id, age, city, country, email, first_name, gender, last_name, latitude, longitude, state, traffic_source, orders.id, orders.status, orders.is_complete, user_order_facts.total_orders, user_order_facts.total_spent]
}

# orders.view.lkml
measure: count {
  type: count
  drill_fields: [id, user_id, status, is_complete, products.id, products.name, products.category, products.subcategory, products.brand, user_order_facts.total_orders, user_order_facts.total_spent]
}

# inventory_items.view.lkml
measure: count {
  type: count
  drill_fields: [id, distribution_center_id, product_id, cost, quantity, products.id, products.name, products.category, products.subcategory, products.brand, user_order_facts.total_orders, user_order_facts.total_spent]
}

# user_order_facts.view.lkml
# Assuming there is no need to add the count measure here, as it would be redundant with the total_orders measure.
