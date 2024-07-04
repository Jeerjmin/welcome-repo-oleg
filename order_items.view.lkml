
# users.view.lkml

measure: count {
  type: count
  drill_fields: [id, first_name, last_name, order_items.count]
}
