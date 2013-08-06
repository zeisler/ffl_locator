class Dealer < ActiveRecord::Base
  belongs_to :license
  attr_accessor :distance

  def self.within(radius, lat, lng, limit)
    math = "( 3959 * acos( cos( radians( #{ActiveRecord::Base.sanitize lat}) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians( #{ActiveRecord::Base.sanitize lng}) ) + sin( radians( #{ActiveRecord::Base.sanitize lat}) ) * sin( radians( lat ) ) ) )"
    results_raw = ActiveRecord::Base.connection.execute(
      "SELECT id, #{math}
      AS distance
      from dealers
      where #{math}  < #{ActiveRecord::Base.sanitize radius}
      ORDER BY distance limit  #{ActiveRecord::Base.sanitize limit};")
    results_raw.map do |row|
      dealer = Dealer.find_by_id(row["id"])
      dealer.distance = row["distance"]
      dealer
    end
  end

  def business_name
    if self[:business_name] == "null"
      return self[:license_name]
    else
      return self[:business_name]
    end
  end

end
