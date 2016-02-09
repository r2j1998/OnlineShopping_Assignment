json.array!(@orders) do |order|
  json.extract! order, :id, :product_id, :customer_id, :quantity, :delivery_date, :status
  json.url order_url(order, format: :json)
end
