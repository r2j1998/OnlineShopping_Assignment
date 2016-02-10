json.array!(@orders) do |order|
  json.extract! order, :id, :order_no, :tracking_no, :delivery_date, :order_value, :amount, :delivery_type
  json.url order_url(order, format: :json)
end
