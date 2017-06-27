#comma separated values
require 'csv'

CSV.foreach('customers.csv', headers: true) do |row|
  puts "person #{row['first_name']}, #{row['last_name']}"
end
