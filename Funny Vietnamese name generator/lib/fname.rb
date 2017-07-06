$names = [
  "Diep Shit",
  "Long Dong",
  "Chew Kok",
  "Gan Ban",
  "Phat Ho",
  "Suk Dik",
  "Bik Dik",
  "Krak Hoe",
  "Pee Ho",
  "Ho Ho",
  "Don Lie",
  "Gay Gy",
  "Ho Mo",
  "Pho Sho",
  "Duk Duk Goo",
  "Boo Who",
  "Boo Be",
  "I Ly",
  "Bic Butt",
  "Canh Nat Lie",
  "Cum Sten",
  "Cum Nao",
  "Cum Har",
  "She Bang",
  "Phuc Ngo",
  "Phuc Yu",
  "Phuc Dat",
  "Butt Hoe",
  "Phat Phuc",
  "Mo Pho",
  "Phuc Dat Bich",
  "Pho Kim Long",
]

class Funames
  def self.name_change(user)
    puts "\n" * 2
    puts "Hi #{user}, are you ready to be Vietnamese?"
    puts "\n"
    puts "You are now '#{$names.sample}'"
    puts "\n" * 2    
  end
end
