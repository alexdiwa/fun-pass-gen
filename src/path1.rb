require 'artii'

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

def encrypt(str, num)
  encrypted_str = ""
  str.each_char do |item|
    if ALPHABET.include?(item)
      new_idx = (ALPHABET.index(item) + num) % 26
      encrypted_str += ALPHABET[new_idx]
    elsif NUMBERS.include?(item)
      new_idx = (NUMBERS.index(item) + num) % 10
      encrypted_str += NUMBERS[new_idx]
    end
  end
  encrypted_str
end


# def decrypt(str, num)
#   decrypted_str = ""
#   str.each_char do |item|
#     if ALPHABET.include?(item)
#       new_idx = (ALPHABET.index(item) - num) % 26
#       decrypted_str += ALPHABET[new_idx]
#     elsif NUMBERS.include?(item)
#       new_idx = (NUMBERS.index(item) - num) % 10
#       decrypted_str += NUMBERS[new_idx]
#     end
#   end
#   decrypted_str
# end


puts ""
puts ""
puts ""
puts "-----------------------------------------------------------------------"
puts ""
puts ""
a = Artii::Base.new
puts a.asciify('FunPassGen')
puts ""
puts "Hello! Welcome to the FunPassGen, a fun password generator!"
puts ""
puts "We're going to ask you a series of questions to help generate"
puts "a password for you that you'll remember."
puts ""
puts ""
puts "Hit ENTER/RETURN to continue"
puts "(or CTRL + C to quit at any time)"
puts ""
puts ""
puts "-----------------------------------------------------------------------"
puts ""
puts ""
enter = gets.chomp

continue = true

while continue
  puts ""
  puts "Are you CLASSIC (1) or QUIRKY (2)? (type in a number and hit ENTER)"
  puts ""
  choice = gets.chomp 
  puts ""
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
    puts "And that's it! Thanks for your help!"
    puts ""
    puts "Drumroll please while your password is generated......"
    puts ""
    puts "(hit ENTER)"
    gets.chomp
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
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
    puts "~~ Imagine yourself (that's you, #{$answers[0]} #{$answers[1]}!) ~~"
    puts "~~ Sippin' on #{$answers[2]} #{$answers[3]}(s) ~~"
    puts "~~ In a cute #{$answers[4]} in #{$answers[5]}! ~~"
    puts "~~ Sllllurp! ~~"
    puts ""
    puts "~~ Wooow! So easy! And so FUN! ~~"
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
    puts ""
    puts ""
    puts ""
    puts ""
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
    puts "With my pal #{$answers[0]}, I #{$answers[1]} into the night"
    puts "I turn into a baby #{$answers[2]}, colored #{$answers[3]} with #{$answers[4]} arms"
    puts "Although mighty, I am hungry. I'm off to eat #{$answers[6]} #{$answers[5]}." 
    puts ""
    puts "-----------------------------------------------------------------------"
    
    continue = false

  else
    puts "-----------------------------------------------------------------------"
    puts ""
    puts ""
    puts "Oops! Please type 1 or 2, and hit ENTER!"
    puts ""
    puts ""
    puts "-----------------------------------------------------------------------"
  end

end

continue = true
while continue
  puts ""
  puts "Do you want to encrypt your password? (Y/N)"
  puts ""
  pword_encrypt = gets.chomp
  if pword_encrypt.downcase == "y"
    puts ""
    puts "What's your birth date?"
    puts ""
    birth_date = gets.chomp.to_i
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts "Your encrypted password is:"
    puts ""
    puts encrypted_pword = encrypt(generate_password($answers), birth_date)
    puts ""
    puts "Write this down somewhere safe, and keep it a secret!"
    puts ""
    puts "If you want to decode it manually, just go back #{birth_date} spaces/indices for each letter in the alphabet, and numeric digit in the range 0 through to 9"
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts ""
    puts "Thanks for using FunPassGen! Goodbye!"
    puts ""
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    continue = false
  elsif pword_encrypt.downcase == "n"
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    puts ""
    puts "Thanks for using FunPassGen! Goodbye!"
    puts ""
    puts ""
    puts "-----------------------------------------------------------------------"
    puts ""
    continue = false
  else
    puts ""
    puts "Please type Y or N, and hit ENTER!"
    puts ""
  end
end


# continue = true
# while continue
#   puts ""
#   puts "Do you want to decrypt your password? (Y/N)"
#   puts ""
#   pword_decrypt = gets.chomp
#   if pword_decrypt.downcase == "y"
#     puts ""
#     puts "Your decrypted password is:"
#     puts ""
#     puts decrypted_pword = decrypt(encrypted_pword, birth_date)
#     puts ""
#     continue = false
#   elsif pword_decrypt.downcase == "n"
#     puts ""
#     puts "Thanks for using FunPassGen! Goodbye!"
#     puts ""
#     continue = false
#   else
#     puts ""
#     puts "Please type Y or N, and hit ENTER!"
#     puts ""
#   end
# end