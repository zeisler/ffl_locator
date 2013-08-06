json.array!(@dealers) do |dealer|
  json.extract! dealer, :license_id, :license_name, :business_name, :street, :city, :state, :zip_code, :phone, :lat, :lng, :distance
  json.web dealer_url(dealer, format: :html)
end
