def validate_letters(str)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  arr = str.split("")

  arr.all? do |letter|
    alphabet.include?(letter.downcase)
  end
end

def validate_numbers(num)
  numbers = "0123456789"
  arr = num.split("")

  arr.all? do |number|
    numbers.include?(number)
  end
end


puts "Hello! Welcome to the FunPassGen, a fun password generator! We're going to ask you a series of questions to help generate a password for you that you'll remember."
puts ""
puts "Hit ENTER/RETURN to continue"
enter = gets.chomp

puts "What's your first name?"
first_name = gets.chomp

until validate_letters(first_name) and first_name != ""
  puts "Letters only please :)"
  puts "What's your first name?"
  first_name = gets.chomp
end

puts "Nice one! What about your last name?"
  last_name = gets.chomp

until validate_letters(last_name) and last_name != ""
    puts "Letters only please :)"
    puts "What's your last name?"
    last_name = gets.chomp
end

puts "Super! What's your lucky number?"
  lucky_num = gets.chomp
  
until validate_numbers(lucky_num) and lucky_num != ""
    puts "Numbers only please :)"
    puts "What's your lucky number?"
    lucky_num = gets.chomp
end

password = first_name[-1] + last_name[-1].upcase + lucky_num


puts "Your password is... Drumroll please......."
puts password
puts ""
puts "#{first_name} #{last_name}'s lucky number is #{lucky_num}"


  








  
#xE42