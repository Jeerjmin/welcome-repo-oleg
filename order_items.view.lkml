
explore: products {
  join: inventory_items {
    type: left_outer
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
  }
}

explore: users {
  join: user_order_facts {
    type: left_outer
    relationship: 1_to_1
    sql_on: ${users.id} = ${user_order_facts.user_id} ;;
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
  }
  join: products {
    type: left_outer
    sql_on: ${orders.product_id} = ${products.id} ;;
  }
}
