json.array!(@dealers) do |dealer|
  json.extract! dealer, :licence_id, :licence_name, :business_name, :street, :city, :state, :zip_code, :phone, :lat, :lng, :distance
  json.web dealer_url(dealer, format: :html)
end
