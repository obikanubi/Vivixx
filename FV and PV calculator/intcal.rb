def fvcal (pv, r, i)
  fv = pv.to_f * (1+(r.to_f / 100)) ** i.to_f
  puts fv.to_f.round(2)
end

def pvcal (fv, r, i)
  pv = fv.to_f / (1+(r.to_f / 100)) ** i.to_f
  puts pv.to_f.round(2)
end

def futurevalue
  print "Type in present value: "
  user_input = gets.chomp
  print "Type in rate: "
  user_input2 = gets.chomp
  print "Type in number of periods: "
  user_input3 = gets.chomp
  fvcal(user_input, user_input2, user_input3)
end

def presentvalue
  print "Type in future value: "
  user_input = gets.chomp
  print "Type in rate: "
  user_input2 = gets.chomp
  print "Type in number of periods: "
  user_input3 = gets.chomp
  pvcal(user_input, user_input2, user_input3)
end

def start
  puts "Press F for future value. Press P for present value"
  start = gets.chomp.capitalize
  if start == "F"
    futurevalue
  elsif start == "P"
    presentvalue
  else
    puts "Invalid input"
  end
end

start
