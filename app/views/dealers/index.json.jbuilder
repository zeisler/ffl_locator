json.array!(@dealers) do |dealer|
  json.extract! dealer, :licence_type, :licence_name, :business_name, :street, :state, :zip_code, :lat, :long
  json.url dealer_url(dealer, format: :json)
end
