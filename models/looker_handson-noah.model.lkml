connection: "looker_handson-noah"

# include all the views
include: "/views/**/*.view"

datagroup: looker_handson-noah_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_handson-noah_default_datagroup

explore: stores {}

explore: channels {}

explore: transaction {
  join: stores {
    type: left_outer
    sql_on: ${transaction.store_id} = ${stores.id} ;;
    relationship: many_to_one
  }

  join: channels {
    type: left_outer
    sql_on: ${transaction.channel_id} = ${channels.id} ;;
    relationship: many_to_one
  }

  join: transaction__line_items {
    view_label: "Transaction: Line Items"
    sql: LEFT JOIN UNNEST(${transaction.line_items}) as transaction__line_items ;;
    relationship: one_to_many
  }
}

explore: products {}
