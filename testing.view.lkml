
# orders.view.lkml

view: orders {
  include: user_order_facts
  include: products
  include: users
  include: inventory_items

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: is_complete {
    type: yesno
    sql: ${status} = 'yes' ;;
  }

  # other dimensions...

  measure: count {
    type: count
  }

  # other measures...

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

  # other dimensions...

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, order_items.count]
  }

  # other measures...

}

# products.view.lkml

view: products {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # other dimensions...

  measure: count {
    type: count
    drill_fields: [
      id,
      name,
      distribution_centers.id,
      distribution_centers.name,
      inventory_items.count,
    ]
  }

  # other measures...

}

# inventory_items.view.lkml

view: inventory_items {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # other dimensions...

  measure: count {
    type: count
    drill_fields: [id, products.id, products.name, order_items.count]
  }

  # other measures...

}

# user_order_facts.view.lkml

view: user_order_facts {
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    primary_key: yes
    hidden: yes
  }

  # other dimensions...

}
