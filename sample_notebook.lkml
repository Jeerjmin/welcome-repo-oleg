
# File: retail_company.model.lkml

connection: "retail_db"

# Explore for Orders
explore: orders {
  from: orders
  join: order_items {
    type: left_outer
    sql_on: ${orders.id} = ${order_items.order_id} ;;
    relationship: one_to_many
  }
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

# Explore for Order Items
explore: order_items {
  from: order_items
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }
  join: products {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} AND ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
  join: distribution_centers {
    type: left_outer
    sql_on: ${inventory_items.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

# Explore for Products
explore: products {
  from: products
  join: inventory_items {
    type: left_outer
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
    relationship: one_to_many
  }
}

# Explore for Users
explore: users {
  from: users
  join: orders {
    type: left_outer
    sql_on: ${users.id} = ${orders.user_id} ;;
    relationship: one_to_many
  }
  join: user_order_facts {
    type: left_outer
    sql_on: ${users.id} = ${user_order_facts.user_id} ;;
    relationship: one_to_one
  }
}

# Explore for Distribution Centers
explore: distribution_centers {
  from: distribution_centers
  join: inventory_items {
    type: left_outer
    sql_on: ${distribution_centers.id} = ${inventory_items.distribution_center_id} ;;
    relationship: one_to_many
  }
}

# Explore for Inventory Items
explore: inventory_items {
  from: inventory_items
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
  join: distribution_centers {
    type: left_outer
    sql_on: ${inventory_items.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

# Wide Table Explore
explore: wide_table {
  from: orders
  join: order_items {
    type: left_outer
    sql_on: ${orders.id} = ${order_items.order_id} ;;
    relationship: one_to_many
  }
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  join: products {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} AND ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
  join: distribution_centers {
    type: left_outer
    sql_on: ${inventory_items.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }
  join: user_order_facts {
    type: left_outer
    sql_on: ${users.id} = ${user_order_facts.user_id} ;;
    relationship: one_to_one
  }
}
