
<<<<<<< HEAD
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
=======
# users.view.lkml
<<<<<<< HEAD

view: users {
  sql_table_name: public.users ;;

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

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, order_items.count]
  }

  measure: user_count {
    type: count_distinct
    sql: ${id} ;;
    description: "This measure counts the unique number of users in the database."
  }
=======
measure: user_count {
  type: count
  sql: ${TABLE}.id ;; # Assuming id is the unique user identifier
>>>>>>> refs/remotes/origin/main
>>>>>>> refs/remotes/origin/main
}

# user_order_facts.view.lkml
# Assuming there is no need to add the count measure here, as it would be redundant with the total_orders measure.
