require 'csv'
blocks = []
index = 0
PATH = File.expand_path('')
CSV.foreach("#{PATH}/db/ffl_dealers.csv") do |row|
  blocks << row[0]
  index += 1
end

block_count = ( blocks.count / 1000 ) + 1
block_count.times do |i|
   Dealer.transaction do
     current = i * 1000
     1000.times do |trans_i|
       unless blocks[trans_i + current].nil?
         Dealer.connection.execute "INSERT INTO Dictionaries (word) values ('#{blocks[trans_i + current]}')"
       end
     end
   end
end
