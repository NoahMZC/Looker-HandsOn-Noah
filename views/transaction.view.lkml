view: transaction {
  derived_table: {
    sql:
      SELECT
        transaction_timestamp
       ,transaction_id
       ,store_id
       ,channel_id
       ,product_id
       ,sale_price
       ,gross_margin
      FROM
        `mzcdsc-team-200716.Looker_HandsOn.transaction`
       ,UNNEST(line_items);;
  }
  dimension_group: transaction_timestamp {
    group_label: "시점"
    label: "거래 일시"
    type: time
    timeframes: [
      time,
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: timestamp
    sql: ${TABLE}.transaction_timestamp  ;;
  }
  dimension: transaction_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: product_id {
    hidden: yes
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: channel_id {
    hidden: yes
    type: string
    sql: ${TABLE}.channel_id ;;
  }
  measure: sale_price {
    label: "판매액"
    type: sum
    sql: ${TABLE}.sale_price ;;
    value_format: "$0.00"
  }
  measure: gross_margin {
    label: "매출 총 이익"
    type: sum
    sql: ${TABLE}.gross_margin ;;
    value_format: "$0.00"
  }
  measure: count {
    type: count
  }
}
