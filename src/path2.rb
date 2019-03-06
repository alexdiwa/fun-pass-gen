# -----------------------------------------------------------

# path1.rb and path2.rb were used to draft our code for
# index.rb, before we combined the two into one cohesive page
# of code. path1.rb corresponded to option 1 (standard) path
# while path2.rb and option 2 was the quirky path.

# -----------------------------------------------------------

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


puts "Hello! Welcome to the FunPassGen, a fun password generator! Using a compelling narrative, we will combine your answers to a series of questions that will generate a unique and secure password that you can easily remember! Just follow along for the ride. Here we go!"

puts ""
puts "Hit ENTER/RETURN to continue"
enter = gets.chomp

alphabet = ""

puts "You're walking around at night with a person. Who is that person? "
person_name = gets.chomp

until validate_letters(person_name) and person_name != ""
  puts "Letters only please :)"
  puts "You're outside walking around at night Who are you with? "
  person_name = gets.chomp
end

puts "The full moon rises. You howl...."
  howl = gets.chomp

until validate_letters(howl) and howl != ""
    puts "Letters only please :)"
    puts "The full moon rises. You howl...."
    howl = gets.chomp
end

puts "You turn into a/an...? "
  figure = gets.chomp
  
until validate_letters(figure) and figure != ""
    puts "Letters only please :)"
    puts "You turn into a/an...? "
    figure = gets.chomp
end

puts "What colour are you? "
    color = gets.chomp
  
until validate_letters(color) and color != ""
    puts "Letters only please :)"
    puts "What colour are you? "
    color = gets.chomp
end

puts "How many limbs do you have? "
  num_limbs = gets.chomp
  
until validate_numbers(num_limbs) and num_limbs != ""
    puts "Numbers only please :)"
    puts "How many limbs do you have? "
    num_limbs = gets.chomp
end

puts "You've been walking for a while now and you're hungry. What resturant do you go into? "
    restaurant = gets.chomp
    
  until validate_letters(restaurant) and restaurant != ""
      puts "Letters only please :)"
      puts "You've been walking for a while now and you're hungry. What resturant do you go into? "
      restaurant = gets.chomp
  end
  
  puts "You have a magic belly which can take an unlimited number of dishes. How many do you order? "
    num_dishes = gets.chomp
    
  until validate_numbers(num_dishes) and num_dishes != ""
      puts "Numbers only please :)"
      puts "You have a magic belly which can take an unlimited number of dishes. How many do you order? "
      num_dishes = gets.chomp
  end

  puts ""

  puts "And that's it! Thanks for your help!"

  puts ""

  puts "Drumroll please while your password is generated......"

  puts ""

  password = person_name[-1].capitalize + howl[0...2] + figure[-1].upcase + color[2].swapcase + num_limbs[0] + restaurant[0] + num_dishes[1] 

  puts "Voila! Your password is #{password}"



puts ""

puts "Here's a phrase to help you remember your password :) "

puts "With #{person_name}, I #{howl}-ed into the night
I turned into a #{figure}, coloured #{color} with #{num_limbs} arms
Although mighty, I am hungry, I'm off to devour #{num_dishes} #{restaurant} dishes"











