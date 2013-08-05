json.array!(@dealers_with_distance) do |dealer|
  json.extract! dealer, :licence_id, :licence_name, :business_name, :street, :state, :zip_code, :phone, :lat, :lng
  json.url dealer_url(dealer, format: :json)
end
