json.array!(@shipper_addresses) do |shipper_address|
  json.extract! shipper_address, :id, :city, :district, :state, :country, :pincode
  json.url shipper_address_url(shipper_address, format: :json)
end
