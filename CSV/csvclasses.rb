#here we have a class person. It can be initialized from a hash
require 'CSV'

class Person
  attr_accessor :firstname, :lastname, :suburb, :age, :gender

 def initialize(hash)
   @firstname = hash[:firstname]
   @lastname = hash[:lastname]
   @suburb = hash[:suburb]
   @age = hash[:age]
   @gender = hash[:gender]
 end
 #We add a class method to initialize from a CSV::Row object, which CSV.foreach will give us. We create a
 #hash and pass it to our initializer

#Initialize from CSV::row
 def self.from_csv_row(row)
  self.new({
    firstname: row['firstname'],
    lastname: row['lastname'],
    suburb: row['suburb'],
    age: row['age'].to_i,
    gender: row['gender']
    })
  end
#from our class to CSV row
#WE add an instance method to create a CSV::Row object
#We also add a class constant with all the headers
  HEADERS = ['firstname', 'lastname', 'suburb', 'age', 'gender']
  #convert to CSV::Row
  def to_csv_row
    CSV::Row.new(HEADERS, [firstname, lastname, suburb, age, gender])
  end
end
#create new Person
person = Person.new({
  firstname: "John",
  lastname: "Appleseed",
  suburb: "Brisbane",
  age: 42,
  gender: :male
  })

  #append person to the CSV file
  CSV.open('people.csv', 'a+') do |csv|
    csv << person.to_csv_row
  end
#Modifying workflow: Read CSV rows as our class objects
#WE read each row from the CSV using CSV.foreach
#We create a Person instance from the row, and add it to an array
people = []
#Loop over each row in the CSV
CSV.foreach('people.csv', headers: true) do |row|
  #convert from CSV::Row to Person instance
  person = Person.from_csv_row(row)
  #add objectd to array
  people << person
  #Display first and last name
  puts "#{person.firstname} #{person.lastname}"
end
