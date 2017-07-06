=begin
Dan has started his own car shop,
the customers are demanding for an easier way to order and dress up their cars.
You are to build a menu system that calculates the price of a car,
given different options like paint color, wheels, etc..
=end

require 'CSV'
$cars_array = []
$custom_car = []
$tracking_num = []
$cars = CSV.read('csv_cars.csv')

CSV.foreach('csv_cars.csv', headers: true) do |car|
  $cars_array << car
end

def user_input
  @user = gets.chomp
end

def menu_checkout
  if $custom_car.empty?
    puts "\n" * 30
    puts "Please select a car from: ".prepend(" " * 3)
    puts "\n"
    puts "Buy car" .prepend(" " * 3)
    puts "\n"
    puts "Customize car".prepend(" " * 3)
    puts "\n"
    puts "Press ENTER to return to Menu".prepend(" " * 3)
    puts "\n" * 24
    print "   >>>"
  else
    puts "\n" * 30
    puts "Car: ".prepend(" " * 3) + $custom_car[0][1]
    puts "\n"
    puts "Price: ".prepend(" " * 3) + $custom_car[0][6]
    puts "\n"
    puts "Press Enter to confirm purchase".prepend(" " * 3)
    puts "\n" * 24
    print "   >>>"
    gets
    exit_screen
  end
end

def exit_screen
  puts "\n" * 30
  puts "Thank you for shopping with us.".center(70)
  puts "\n" * 30
  print "   >>>"
end

def welcome_screen
  puts "\n" * 20
  puts "Hi and welcome to Dan's Toyota Car shop".center(70)
  puts "\n"
  puts "Please select an option below:".center(70)
  puts "\n" * 10
  puts "1. Browse base models".prepend(" " * 3)
  puts "\n" * 2
  puts "2. Buy car".prepend(" " * 3)
  puts "\n" * 2
  puts "3. Customize car".prepend(" " * 3)
  puts "\n" * 2
  puts "4. Car Tracker".prepend(" " * 3)
  puts "\n" * 2
  puts "5. Checkout".prepend(" " * 3)
  puts "\n" * 2
  puts "6. Exit".prepend(" " * 3)
  puts "\n" * 24
  print "   >>>"
end

def menu_cars
  puts "\n" * 10
  num = 0
  CSV.foreach('csv_cars.csv', headers: true) do |car|
    num += 1
    puts "=".center(70, "=")
    puts "#{num}"
    puts "Car Name: #{car['car_name']}, Car Type: #{car['car_type']}, Color: #{car['car_color']},".prepend(" " * 3)
    puts "Transmission: #{car['transmission']}, Wheels: #{car['wheels']},".prepend(" " * 3)
    puts "Price #{car['car_price']}".prepend(" " * 3)
    puts "Availability: #{car['availability']}".prepend(" " * 3)
    puts "=".center(70, "=")
    puts "\n" * 2
  end
  puts "\n" * 2
  puts "Press ENTER to continue shopping".center(70)
  puts "\n" * 2
  print "   >>>"
end

def menu_buy
  puts "\n" * 10
  CSV.foreach('csv_cars.csv', headers: true) do |car|
    puts "=".center(70, "=")
    puts "#{car['id']}"
    puts "Car Name: #{car['car_name']}, Car Type: #{car['car_type']}, Color: #{car['car_color']},".prepend(" " * 3)
    puts "Transmission: #{car['transmission']}, Wheels: #{car['wheels']},".prepend(" " * 3)
    puts "Price #{car['car_price']}".prepend(" " * 3)
    puts "Availability: #{car['availability']}".prepend(" " * 3)
    puts "=".center(70, "=")
    puts "\n" * 2
  end
  puts "\n" * 4
  puts "Enter car number to purchase: ".prepend(" " * 3)
  print "   >>>"
  user_input
  CSV.foreach('csv_cars.csv', headers: true) do |car|
    case @user
    when car['id']
      $custom_car << car
      system "cls"
      puts "\n" * 25
      puts "You chose: ".prepend(" " * 3)
      puts "\n"
      puts "#{car['car_color']} #{car['car_name']}".prepend(" " * 3)
      puts "\n"
      puts "#{car['transmission']} transmission".prepend(" " * 3)
      puts "\n"
      puts "#{car['wheels']} wheels".prepend(" " * 3)
      puts "\n"
      if car['availability'] == 'In Stock'
        puts "\n"
        puts "The price is: #{car['car_price']}".prepend(" " * 3)
        puts "\n" * 23
        puts "Press ENTER then proceed to checkout".prepend(" " * 3)
        print "   >>>"
      else
        puts "Car is not in the store. Would you like to order one? Y/N".prepend(" " * 3)
        puts "\n" * 24
        print "   >>>"
        user_input
        if @user.upcase == "Y"
          puts "Press ENTER then proceed to Checkout".prepend(" " * 3)
          print "   >>>"
        elsif @user.upcase == "N"
          system "cls"
          exit_screen
          gets
          exit
        else
          puts "Invalid input press ENTER to try again".prepend(" " * 3)
        end
      end
    end
  end
  gets
end

loop do
  system "cls"
  welcome_screen
  user_input
  case @user
  when "1"
    system "cls"
    menu_cars
    gets
  when "2"
    system "cls"
    menu_buy
  when "3"
    system "cls"
    #menu_customize
  when "4"
    #menu_tracker
  when "5"
    system "cls"
    menu_checkout
    gets
  when "6"
    system "cls"
    exit_screen
    gets
    break
  end
end
