json.array!(@shipping_addresses) do |shipping_address|
  json.extract! shipping_address, :id, :city, :district, :state, :country, :pincode
  json.url shipping_address_url(shipping_address, format: :json)
end
