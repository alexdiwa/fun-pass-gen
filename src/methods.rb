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
$colorized_answers = []

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

# A method that colorizes that generates a new array, where the first characters of each
# word is colorized. This is for the memorable story output that the user sees
# after the password is generated, and works even for multi-word entries (e.g. New York City).
# However, this does not work for numbers (extra logic was needed and beyond scope of
# code) and only colorizes the first digit for numbers more than 1 digit in length.
# we therefore called upon $answers[index] instead of #colorized_answers[index]
# for the numerical output in the memorable story.
def colorize_answers(arr)
  arr.each do |ele|
    words = ele.split(" ")
    colored_words = []
    if words.length > 1
      words.each do |word|
        colored_words << word[0].colorize(:red) + word[1..-1]
      end
      $colorized_answers << colored_words.join(" ")
    else
      $colorized_answers << words[0][0].colorize(:red) + words[0][1..-1]
    end
  end
  $colorized_answers
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