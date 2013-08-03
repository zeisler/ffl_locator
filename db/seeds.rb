require 'csv'
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
        row[index] = ""
      end
      row[index] = row[index].gsub("\\","")
      row[index] = row[index].gsub("\"","")

      row_with_keys[key] = row[index]
    end
    blocks << row_with_keys unless row_with_keys["lat"] == "0"
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
         Dealer.connection.execute ["INSERT INTO Dealers (?) values (?)", row.keys.map(&:inspect).join(', ').gsub('"', ''), row.values.map(&:inspect).join(', ')]
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


