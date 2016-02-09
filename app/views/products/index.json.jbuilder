json.array!(@products) do |product|
  json.extract! product, :id, :category_id, :company_id, :product_name, :description, :price, :quantity, :sku
  json.url product_url(product, format: :json)
end
