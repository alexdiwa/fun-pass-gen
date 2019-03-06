# Gem for generating ASCII word art
require 'artii'
# Gem for making the app more colourful, interactive and easy to use.
require 'colorize'
# Set as constants so that they can be accessed from anywhere in the program, and because
# they just needed to be referred to and not changed. 
ALPHABET = "abcdefghijklmnopqrstuvwxyz"
NUMBERS = "0123456789"
# Creating an empty array that will hold the answers from the user
# We used a global variable so that the answers array could be accessed from anywhere in the
# program, but specifically the ask_question and encrypt methods.
$answers = []

# Method that checks whether input string is valid when only letters are expected
# We made this method comprehensive to account for empty strings, " " and special characters
def validate_letters(str)
  arr = str.gsub(" ", "").split("")
  result = arr.all? { |letter| ALPHABET.include?(letter.downcase) }
  result = false if arr.empty?
  puts "Letters only, please! :)".colorize(:red) if result == false
  result
end

# Method that checks whether input string is valid when only numbers are expected
# We made this method comprehensive to account for empty strings, " " and special characters
def validate_numbers(num)
  arr = num.gsub(" ", "").split("")
  result = arr.all? { |number| NUMBERS.include?(number) }
  result = false if arr.empty?
  puts "Numbers only, please! :)".colorize(:red) if result == false
  result
end

# Method that generates a question, and only lets the user progress if it is
# answered in the correct format (and which calls the validate_letters/numbers methods).
# The method stores the answers in an array.
# We used 'send' to call a method in using a string, so that it could be
# flexible depending on whether the expected input was a string of letters or numbers.
def ask_question(question, method)
  puts ""
  puts question.colorize(:yellow)
  puts ""
  var_name = gets.chomp
  until send(method, var_name)
    puts ""
    puts question.colorize(:yellow)
    puts ""
    var_name = gets.chomp
  end
  $answers << var_name.strip
# we used strip to remove surrounding whitespace, so that
# generated password did not have any gaps
end

# A method that generates a unique password for the user based on their given answers.
# The method takes in an array, and clips off the first character for letter strings,
# and takes the entire number for numerical strings.
      #we used an if/else here to distinguish letters from number strings.
      #We used nested iterators to take the first letter of each 
      #word for multiple-word inputs e.g. New York City --> NYC
      #the else statement takes care of numerical cases, so that the whole number
      #is added, and not just the first character of that numerical string
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


# A method that encrypts the generated password by cycling through spaces in the alphabet
# or numbers 0..9, depending on a number that the user inputs (user birth date).
# We used if/elsif/else to distinguish between downcase letters (if), upcase letters(elsif)
# and numbers. The elsif statement allows us to maintain the character casing of the input while
# encrypting i.e. the output has the same case as the input. 
def encrypt(str, num)
  encrypted_str = ""
  str.each_char do |item|
    if ALPHABET.include?(item)
      new_idx = (ALPHABET.index(item) + num.to_i) % 26
      encrypted_str += ALPHABET[new_idx]
    elsif ALPHABET.include?(item.downcase)
      new_idx = (ALPHABET.index(item.downcase) + num.to_i) % 26
      encrypted_str += ALPHABET[new_idx].upcase
    elsif NUMBERS.include?(item)
      new_idx = (NUMBERS.index(item) + num.to_i) % 10
      encrypted_str += NUMBERS[new_idx]
    end
  end
  encrypted_str
end


# Welcome page that uses the Artii gem for a bold display as the introduction.
puts ""
puts ""
puts ""
puts "-----------------------------------------------------------------------"
puts ""
puts ""
a = Artii::Base.new
puts a.asciify('FunPassGen').colorize(:green)
puts ""
puts "Hello! Welcome to the FunPassGen, a fun password generator!"
puts ""
puts "We're going to ask you a series of questions to help generate"
puts "a password for you that you'll remember."
puts ""
puts ""
puts "Hit ENTER/RETURN to continue".colorize(:yellow)
puts "(or CTRL + C to quit at any time)"
puts ""
puts ""
puts "-----------------------------------------------------------------------"
puts ""
puts ""
enter = gets.chomp

continue = true

# We used a while loop and an if/elsif/else control flow structure within
# to allow the user to select different paths, but also be prompted to re-enter
# their selection if they put in an invalid string.
while continue
  puts ""
  puts "Are you CLASSIC (1) or QUIRKY (2)? (type in a number and hit ENTER)".colorize(:blue)
  puts ""
  choice = gets.chomp 
  puts ""
  # Path 1 - Classic path. More standard questions for the user to experience.
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
    puts "And that's it! Thanks for your help!".colorize(:blue)
    puts ""
    puts "Drumroll please while your password is generated......".colorize(:blue)
    puts ""
    puts "(hit ENTER)".colorize(:green)
    gets.chomp
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts "                          Your passcode is:                            ".colorize(:green)
    puts ""
    puts "                                #{generate_password($answers)}         "
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts "Here's an easy way to remember it!".colorize(:yellow)
    puts ""
    # Inerpolated strings that generate a meaningful message for the user and hence an
    # easy and fun way to remember the password! Used colorize to highlight
    # the characters/numbers used to generate the password.
    puts "~~ Imagine yourself (that's you, #{$answers[0][0].colorize(:red) + $answers[0][1..-1]} #{$answers[1][0].colorize(:red) + $answers[1][1..-1]}!) ~~"
    puts "~~ Sippin' on #{$answers[2].colorize(:red)} #{$answers[3][0].colorize(:red) + $answers[3][1..-1]}(s) ~~"
    puts "~~ In a cute #{$answers[4][0].colorize(:red) + $answers[4][1..-1]} in #{$answers[5][0].colorize(:red) + $answers[5][1..-1]}! ~~"
    puts "~~ Sllllurp! ~~"
    puts ""
    puts "~~ Wooow! So easy! And so FUN! ~~"
    puts ""
    puts "-----------------------------------------------------------------------"
    
    continue = false
  
  # Path 2 - Quirky path. If the user selects 2, they will be asked a different set of questions.
  elsif choice == "2"

    ask_question("You're walking around at night with a person. Who is that person?", "validate_letters")
    ask_question("The full moon rises. You howl...", "validate_letters")
    ask_question("You turn into a/an...", "validate_letters")
    ask_question("What colour are you?", "validate_letters")
    ask_question("How many tentacles do you have?", "validate_numbers")
    ask_question("You've been active for a while now and you're hungry. You go to a restaurant. What meal do you crave?", "validate_letters")
    ask_question("You have a magic belly which can take an unlimited number of dishes. How many do you order?", "validate_numbers")
    
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts "And that's it! Thanks for your help!".colorize(:blue)
    puts ""
    puts "Drumroll please while your password is generated......".colorize(:blue)
    puts ""
    puts "(hit ENTER)".colorize(:green)
    gets.chomp
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts "                          Your passcode is:                            ".colorize(:green)
    puts ""
    puts "                                #{generate_password($answers)}         "
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts "Here's an easy way to remember it!".colorize(:yellow)
    puts ""
    puts "With my pal #{$answers[0][0].colorize(:red) + $answers[0][1..-1]}, I #{$answers[1][0].colorize(:red) + $answers[1][1..-1]} into the night."
    puts "I turn into a baby #{$answers[2][0].colorize(:red) + $answers[2][1..-1]}, colored #{$answers[3][0].colorize(:red)} with #{$answers[4].colorize(:red)} tentacles."
    puts "Although mighty, I am hungry. I'm off to eat #{$answers[6].colorize(:red)} #{$answers[5][0].colorize(:red) + $answers[5][1..-1]}." 
    puts ""
    puts "-----------------------------------------------------------------------"
    
    continue = false
  # Error message if user types in anything other than 1 or 2.
  else
    puts "-----------------------------------------------------------------------"
    puts ""
    puts ""
    puts "Oops! Please type 1 or 2, and hit ENTER!".colorize(:red)
    puts ""
    puts ""
    puts "-----------------------------------------------------------------------"
  end

end

# We implemented this next while loop for the encryption process and prompting the user
# if they wanted to encrypt their password. This section of code redirects the user
# to input again if their input was invalid (not "Y" or "N"), while also 
# including the 'farewell' page, so that the user knows that the program has terminated.
continue = true
while continue
  puts ""
  puts "Do you want to encrypt your password? (Y/N)".colorize(:blue)
  puts ""
  pword_encrypt = gets.chomp
  if pword_encrypt.downcase == "y"
    puts ""
    puts "What's your birth date?".colorize(:yello)
    puts ""
    birth_date = gets.chomp
    until validate_numbers(birth_date)
      puts ""
      puts "What's your birth date?".colorize(:yellow)
      puts ""
      birth_date = gets.chomp
    end 
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts "Your encrypted password is:".colorize(:green)
    puts ""
    puts encrypted_pword = encrypt(generate_password($answers), birth_date)
    puts ""
    puts "Write this down somewhere safe, and keep it a secret!".colorize(:green)
    puts ""
    puts "If you want to decode it manually, just go back #{birth_date.colorize(:yellow)} spaces/indices for each letter in the alphabet, and numeric digit in the range 0 through to 9"
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts ""
    puts "Thanks for using FunPassGen! Goodbye!".colorize(:blue)
    puts ""
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    continue = false
  # Goodbye message
  elsif pword_encrypt.downcase == "n"
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts ""
    puts "Thanks for using FunPassGen! Goodbye!".colorize(:blue)
    puts ""
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    continue = false
  # Error message for encryption Y or N input
  else
    puts ""
    puts "Please type Y or N, and hit ENTER!"
    puts ""
  end
end

