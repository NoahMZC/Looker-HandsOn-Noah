view: products {
  sql_table_name: `mzcdsc-team-200716.Looker_HandsOn.products` ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: category {
    group_label: "제품 정보"
    label: "카테고리"
    type: string
    sql: ${TABLE}.CATEGORY ;;
  }

  dimension: name {
    group_label: "제품 정보"
    label: "제품명"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: brand {
    group_label: "제품 정보"
    label: "브랜드"
    type: string
    sql: ${TABLE}.BRAND ;;
  }
  measure: count {
    type: count
  }
}
