view: transaction {
  sql_table_name: `Looker_HandsOn.transaction`
    ;;
  drill_fields: [transaction_id]

  dimension: transaction_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: channel_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.channel_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: line_items {
    hidden: yes
    sql: ${TABLE}.line_items ;;
  }

  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }

  dimension_group: transaction_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.transaction_timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: [transaction_id, stores.id, stores.name, channels.id, channels.name]
  }
}

view: transaction__line_items {
  dimension: gross_margin {
    type: number
    sql: gross_margin ;;
  }

  dimension: product_id {
    type: number
    sql: product_id ;;
  }

  dimension: sale_price {
    type: number
    sql: sale_price ;;
  }

  dimension: transaction__line_items {
    type: string
    hidden: yes
    sql: transaction__line_items ;;
  }
}
