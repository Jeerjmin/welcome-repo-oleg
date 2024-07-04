
# users.view.lkml
measure: user_count {
  type: count
  sql: ${TABLE}.id ;; # Assuming id is the unique user identifier
}
