connection: "looker_handson-noah"

include: "/views/*.view"

explore: channel {
  group_label: "Looker HandsON Noah"
  label: "채널 정보"
}

explore: products {
  group_label: "Looker HandsON Noah"
  label: "제품 정보"
}
explore: transaction {
  group_label: "Looker HandsON"
  label: "거래 정보"
  join: products {
    type: full_outer
    sql_on: ${transaction.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
  join: channel {
    type: full_outer
    sql_on: ${transaction.channel_id} = ${channel.id};;
    relationship: many_to_one
  }
}
