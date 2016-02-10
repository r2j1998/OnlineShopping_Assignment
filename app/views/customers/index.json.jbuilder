json.array!(@customers) do |customer|
  json.extract! customer, :id, :email, :fname, :lname, :mobile_no, :birth_date
  json.url customer_url(customer, format: :json)
end
