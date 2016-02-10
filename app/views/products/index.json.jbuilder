json.array!(@products) do |product|
  json.extract! product, :id, :category_id, :company_id, :product_name, :description, :price, :quantity, :sku, :lehgth, :width, :hieght, :weight
  json.url product_url(product, format: :json)
end
