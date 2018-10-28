json.array! @orders do |order|
  json.id order.id
  json.product_id order.product_id
  json.user_id order.user_id
  json.subtotal order.subtotal
  json.total order.total
  json.tax order.tax
  json.quantity order.quantity
end
