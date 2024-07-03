
# File: retail_explore.model.lkml
explore: order_items {
  join: products {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }
}

# File: total_sales_by_category.view.lkml
view: total_sales_by_category {
  derived_table: {
    explore_source: order_items {
      column: products.category
      column: order_items.total_sales
    }
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  measure: total_sales {
    type: sum
    sql: ${TABLE}.total_sales ;;
  }
}
