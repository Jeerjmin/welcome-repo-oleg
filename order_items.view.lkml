
explore: products {
  join: inventory_items {
    type: left_outer
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
  }
  
  join: order_items {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
  }
}

explore: users {
  join: orders {
    type: left_outer
    relationship: one_to_many
    sql_on: ${users.id} = ${orders.user_id} ;;
  }
}

explore: distribution_centers {
  join: inventory_items {
    type: left_outer
    sql_on: ${distribution_centers.id} = ${inventory_items.distribution_center_id} ;;
  }
}
