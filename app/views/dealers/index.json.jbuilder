json.array!(@dealers) do |dealer|
  json.extract! dealer, :licence_type, :licence_name, :business_name, :street, :state, :zip_code, :lat, :lng
  json.url dealer_url(dealer, format: :json)
end
