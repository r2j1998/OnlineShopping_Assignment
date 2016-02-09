json.array!(@shipper_details) do |shipper_detail|
  json.extract! shipper_detail, :id, :fname, :lname, :email, :mobile_no, :shipper_address_id
  json.url shipper_detail_url(shipper_detail, format: :json)
end
