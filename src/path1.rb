def validate_letters(str)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  arr = str.gsub(" ", "").split("")

  result = arr.all? do |letter|
    alphabet.include?(letter.downcase)
  end

  if result == false
   puts "Letters only please :)"
  end
  result
end


def validate_numbers(num)
  numbers = "0123456789"
  arr = num.gsub(" ", "").split("")

  result = arr.all? do |number|
    numbers.include?(number)
  end

  if result == false
    puts "Numbers only please :)"
  end
  result
end


def initials(str)
  words = str.split(" ")
    chars = ""
    words.each { |word| chars += word[0] }
   chars
end

$answers = []

def ask_question(question, method)
  puts question
  var_name = gets.chomp

  until send(method, var_name)
    var_name = gets.chomp
  end

  $answers << var_name
end

puts "------------------------------------------------"
puts ""
puts ""
puts "Hello! Welcome to the FunPassGen, a fun password generator! We're going to ask you a series of questions to help generate a password for you that you'll remember."
puts ""
puts "Hit ENTER/RETURN to continue"
puts ""
puts ""
puts "------------------------------------------------"
enter = gets.chomp


puts "Are you classic (1) or quirky (2)? (enter a number and hit ENTER)"
choice = gets.chomp 

if choice == "1"

ask_question("What's your first name?", "validate_letters")
ask_question("What's your last name?", "validate_letters")
ask_question("What's your lucky number?", "validate_numbers")
ask_question("What's your favourite drink? The more imaginative, the better!", "validate_letters")
ask_question("What's your favourite city?", "validate_letters")
ask_question("What's your favourite place?", "validate_letters")
p $answers

elsif choice == "2"

  ask_question("What's your last name?", "validate_letters")

else 
  puts "Please type 1 or 2"
  choice = gets.chomp
end









# puts "What's your first name?"
# first_name = gets.chomp

# until validate_letters(first_name) and first_name != "" and first_name != " "
#   puts "What's your first name?"
#   first_name = gets.chomp
# end

# puts "Nice one! What about your last name?"
# last_name = gets.chomp

# until validate_letters(last_name) and last_name != "" and last_name != " "
#   puts "What's your last name?"
#   last_name = gets.chomp
# end

# puts "Super! What's your lucky number?"
# lucky_num = gets.chomp
  
# until validate_numbers(lucky_num) and lucky_num != "" and lucky_num != " "
#   puts "What's your lucky number?"
#   lucky_num = gets.chomp
# end

# puts "What is your favourite drink? The more imaginative, the better!"
# fav_drink = gets.chomp

# until validate_letters(fav_drink) and fav_drink != "" and lucky_num != " "
#   puts "What's your favourite drink?"
#   fav_drink = gets.chomp
# end

# drink_initials = initials(fav_drink)

# puts "What is your favourite city?"
# fav_city = gets.chomp

# until validate_letters(fav_city) and fav_city != "" and fav_city != " "
#   puts "What's your favourite city?"
#   fav_city = gets.chomp
# end

# city_initials = initials(fav_city)

# puts "What is your favourite place to be? e.g. beach, park, dumpster"
# fav_place = gets.chomp

# until validate_letters(fav_place) and fav_place != "" and fav_place != " "
#   puts "What's your favourite place to be?"
#   fav_place = gets.chomp
# end

# place_initials = initials(fav_place)

# password = first_name[-1] + last_name[-1].upcase + lucky_num + drink_initials + place_initials + city_initials.upcase


# puts "Your password is... Drumroll please......."
# puts password
# puts ""
# puts "#{first_name} #{last_name}'s lucky number is #{lucky_num}"


  








  
#xE42
