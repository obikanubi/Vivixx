#add to a csv file by opening and appending a row array
#open in append mode 'a+'

require 'csv'
require 'SecureRandom'

#skip  post the headers by setting the headers to true
CSV.open("customers.csv", 'a+') do |csv_file|
  #add a row to the csv file
  csv_file << [SecureRandom.uuid, 'Bob', 'Mcgee', 42]
end
