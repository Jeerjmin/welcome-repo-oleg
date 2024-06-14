

# distribution_centers.view.lkml
view: distribution_centers {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: town {
    type: string
    sql: ${TABLE}.town ;;
  }
  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }
  dimension: building {
    type: string
    sql: ${TABLE}.building ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, products.count]
  }
}


# products.view.lkml
view: products {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  # ... other product dimensions ...
  measure: count {
    type: count
    drill_fields: [id, name, distribution_centers.id, distribution_centers.name, inventory_items.count]
  }
}


# users.view.lkml
view: users {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  # ... other user dimensions ...
  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, order_items.count]
  }
}


# orders.view.lkml
view: orders {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  # ... other order dimensions ...
  measure: count {
    type: count
  }
}


# order_items.view.lkml
view: order_items {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  # ... other order item dimensions ...
  measure: count {
    type: count
    drill_fields: [detail*]
  }
}


# inventory_items.view.lkml
view: inventory_items {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }
  # ... other inventory item dimensions ...
  measure: count {
    type: count
    drill_fields: [id, products.id, products.name, order_items.count]
  }
}


# user_order_facts.view.lkml
view: user_order_facts {
  dimension: first_order_date {
    type: date
    sql: ${TABLE}.first_order_date ;;
  }
  dimension: total_orders {
    type: number
    sql: ${TABLE}.total_orders ;;
  }
  # ... other user order facts dimensions ...
}

