
# users.view.lkml

measure: user_count {
  type: count
  sql: ${TABLE}.id ;; # Using ${TABLE}.id ensures that the count is based on unique user IDs.
  description: "Total number of users."
}
