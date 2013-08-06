require 'csv'

def column_types (row)
  row.each do |column, value|
    case column
      when "license_id"
        row["license_id"] = value.to_i
      when "license_name"
        # row["license_name"] = value.to_s
      when "business_name"
        # row["business_name"] = value.to_s
      when "street"
        # row["street"] = value.to_s
      when "city"
        # row["city"] = value.to_s
      when "state"
        # row["state"] = value.to_s
      when "zip_code"
        row["zip_code"] = value.to_i
      when "phone"
        row["phone"] = value.to_i
      when "lat"
        row["lat"] = value.to_f
      when "lng"
        row["lng"] = value.to_f
    end
  end
  return row
end



blocks = []
index = 0
keys = []
PATH = File.expand_path('')
CSV.foreach("#{PATH}/db/ffl_dealers.csv") do |row|
  row_with_keys = {}
  if index == 0
    row.each  do |key|
      keys.push key
    end
  else
    keys.each_with_index do |key, index|
      if row[index] == nil
        row[index] = "null"
      end
      row[index] = row[index].gsub("\\","")
      row[index] = row[index].gsub("\"","")

      row_with_keys[key] = row[index]
    end
    row_with_keys = column_types(row_with_keys)
    blocks << row_with_keys unless row_with_keys["lat"] == 0.0
  end
  index += 1
end


  block_count = ( blocks.count / 1000 ) + 1
block_count.times do |i|
   Dealer.transaction do
     current = i * 1000
     1000.times do |trans_i|
       unless blocks[trans_i + current].nil?
         row = blocks[trans_i + current]
         columns = ActiveRecord::Base.sanitize(row.keys.map(&:inspect).join(', ').gsub('"', '')).gsub("'", '')
         values = ActiveRecord::Base.sanitize(row.values.map(&:inspect).join(', ')).gsub("'", '').gsub('"', "'")
         Dealer.connection.execute("INSERT INTO Dealers (#{columns}) VALUES (#{values})")
       end
     end
   end
end


Licence.create(id: 1, usage: "Title 1 dealer or gunsmith other than destructive devices. Can also deal in Title II NFA firearms with class 3 tax stamp.")
Licence.create(id: 2, usage: "Title 1 dealer doing business as a pawnbroker.")
Licence.create(id: 3, usage: "Licensed collector of Curio & Relic (C&R) firearms.")
Licence.create(id: 6, usage: "Licensed manufacturer of ammunition and reloading components other than ammunition for destructive devices and armor piercing ammunition.")
Licence.create(id: 7, usage: "Title 1 manufacturer of firearms and ammunition, who may also act as dealer; may not manufacture or deal in destructive devices, ammunition for destructive devices, or armor piercing ammunition. Can also manufacture & deal in Title II NFA firearms with class 2 tax stamp.")
Licence.create(id: 8, usage: "Importer of Title 1 firearms and ammunition. Can also import Title II NFA firearms with class 1 tax stamp.")
Licence.create(id: 9, usage: "Dealer in firearms, including destructive devices, ammunition for destructive devices, and armor piercing ammunition. Requires payment as an SOT Class 1 (can act as an NFA Dealer). To deal/broker any DD with an explosives content (e.g. flash-bangs) requires an additional Federal Explosives License[1] as a Dealer of High Explosives.")
Licence.create(id: 10, usage: "Manufacturer of firearms, ammunition and ammunition components, manufacturer of destructive devices, ammunition for destructive devices, and armor piercing ammunition; may also deal in all of the aforementioned items. Requires payment as an SOT Class 2 (can act as an NFA Dealer). To manufacture any DD with an explosives content (e.g. flash-bangs) requires an additional FEL[2] as a Type 20 Manufacturer of High Explosives.")
Licence.create(id: 11, usage: "Importer of firearms, ammunition, destructive devices, ammunition for destructive devices, and armor piercing ammunition; may also deal in all the aforementioned items. Requires payment as an SOT Class 1. To import any DD with an explosives content (e.g. flash-bangs), requires an additional FEL[3] as an Importer of High Explosives.")


