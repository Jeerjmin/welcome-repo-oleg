
# File: ecommerce_model.lookml

connection: "ecommerce_db" {
  persist_for: "24 hours"
}

include: "products.view.lkml"
include: "orders.view.lkml"
include: "users.view.lkml"
include: "inventory_items.view.lkml"
include: "user_order_facts.view.lkml"
