json.array!(@addresses) do |address|
  json.extract! address, :id, :city, :district, :state, :country, :pincode, :customer_id
  json.url address_url(address, format: :json)
end
