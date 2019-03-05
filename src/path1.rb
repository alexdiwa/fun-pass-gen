ALPHABET = "abcdefghijklmnopqrstuvwxyz"
NUMBERS = "0123456789"
$answers = []

def validate_letters(str)
  arr = str.gsub(" ", "").split("")
  result = arr.all? { |letter| ALPHABET.include?(letter.downcase) }
  result = false if arr.empty?
  puts "Letters only, please! :)" if result == false
  result
end

def validate_numbers(num)
  arr = num.gsub(" ", "").split("")
  result = arr.all? { |number| NUMBERS.include?(number) }
  result = false if arr.empty?
  puts "Numbers only, please! :)" if result == false
  result
end

def ask_question(question, method)
  puts ""
  puts question
  puts ""
  var_name = gets.chomp
  until send(method, var_name)
    puts ""
    puts question
    puts ""
    var_name = gets.chomp
  end
  $answers << var_name.strip
end

def generate_password(arr)
  password = ""
  arr.each do |ele|
    words = ele.split(" ")
    words.each do |word|
      if word.split("").all? { |letter| ALPHABET.include?(letter.downcase) }
        password += word[0]
      else
        password += word
      end
    end
  end
  return password
end


puts "-----------------------------------------------------------------------"
puts ""
puts ""
puts "Hello! Welcome to the FunPassGen, a fun password generator! We're going to ask you a series of questions to help generate a password for you that you'll remember."
puts ""
puts "Hit ENTER/RETURN to continue"
puts ""
puts ""
puts "-----------------------------------------------------------------------"
enter = gets.chomp

continue = true

while continue
  puts "Are you classic (1) or quirky (2)? (type in a number and hit ENTER)"
  puts ""
  choice = gets.chomp 

  if choice == "1"

    ask_question("What's your first name?", "validate_letters")
    ask_question("What's your last name?", "validate_letters")
    ask_question("What's your lucky number?", "validate_numbers")
    ask_question("What's your favourite drink? The more imaginative, the better!", "validate_letters")
    ask_question("What's your favourite place? (e.g. park, beach, dumpster)", "validate_letters")
    ask_question("What's your favourite city? (e.g. Sydney, New York City)", "validate_letters")
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts "Your passcode is:"
    puts ""
    puts generate_password($answers)
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts "Here's an easy way to remember it!"
    puts ""
    puts "-----------------------------------------------------------------------"
    
    continue = false

  elsif choice == "2"

    ask_question("You're walking around at night with a person. Who is that person?", "validate_letters")
    ask_question("The full moon rises. You howl...", "validate_letters")
    ask_question("You turn into a/an...", "validate_letters")
    ask_question("What colour are you?", "validate_letters")
    ask_question("How many limbs do you have?", "validate_numbers")
    ask_question("You've been walking for a while now and you're hungry. What resturant do you go into?", "validate_letters")
    ask_question("You have a magic belly which can take an unlimited number of dishes. How many do you order?", "validate_numbers")
    
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts "And that's it! Thanks for your help!"
    puts ""
    puts "Drumroll please while your password is generated......"
    puts ""
    puts "(hit ENTER)"
    gets.chomp
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts "Your passcode is:"
    puts ""
    puts generate_password($answers)
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts "Here's an easy way to remember it!"
    puts ""
    puts "With #{$answers[0]}, I #{$answers[1]} into the night"
    puts "I turn into #{$answers[2]}, colored #{$answers[3]} with #{$answers[4]} arms"
    puts "Although mighty, I am hungry, I'm off to eat #{$answers[6]} #{$answers[5]}" 
    puts ""
    puts "-----------------------------------------------------------------------"
    
    continue = false

  else
    puts "Please type 1 or 2, and hit ENTER!"
  end

end

# continue = true

# while continue
#   puts "Do you want to encrypt your password? (Y/N)"









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
