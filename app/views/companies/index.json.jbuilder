json.array!(@companies) do |company|
  json.extract! company, :id, :company_name, :shipper_details_id
  json.url company_url(company, format: :json)
end
