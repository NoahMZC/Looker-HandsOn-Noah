view: channel {
  sql_table_name: `mzcdsc-team-200716.Looker_HandsOn.channels`;;
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }
  dimension: name {
    label: "채널 명"
    type: string
    sql: ${TABLE}.NAME ;;
  }
  measure: count {
    type: count
  }
}
