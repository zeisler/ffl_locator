class Dealer < ActiveRecord::Base
  belongs_to :licence

  def within(radius, lat, lng)
   ActiveRecord::Base.connection.execute(
    "SELECT lat, lng,
      ( 3959 * acos( cos( radians(45.53299) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(-122.6894) ) + sin( radians(45.53299) ) * sin( radians( lat ) ) ) )
    AS distance
    from dealers
    where ( 3959 * acos( cos( radians(45.53299) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(-122.6894) ) + sin( radians(45.53299) ) * sin( radians( lat ) ) ) ) < #{ActiveRecord::Base.sanitize radius}
    ORDER BY distance limit 10;")
  end

end
