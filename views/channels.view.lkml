view: channels {
  sql_table_name: `Looker_HandsOn.channels`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, transaction.count]
  }
}
