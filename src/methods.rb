require_relative './path1'

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
  puts question
  var_name = gets.chomp
  until send(method, var_name)
    puts question
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