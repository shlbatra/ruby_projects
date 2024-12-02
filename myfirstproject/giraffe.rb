puts "Sahil Batra" # Print new line after
print "Hello world"
print "\n"

# Variable

char_name = "Sahil"
char_age = "36"

puts (char_name + " age is " + char_age)

# Data Types
 
name = "Sahil" # String
age = 75 # Int
gpa = 3.2 # Floating point
ismale = true # Boolean
flaws = nil # Nill datatype

# String functions / methods

phrase = " Strings - \"\" \n New Line "
puts phrase
puts phrase.upcase().strip() # downcase
puts phrase.length()
puts phrase.include? "New"
puts phrase[1] # Get second character
puts phrase.strip()[0,6] # First 6 character excluding initial whitespace
puts phrase.index("L") # index position of character


# Math & Numbers

num = 20.7
puts 5
puts 5.87
puts 2**3 # 2 to power 3, +, -, %, *, /
puts num % 3
puts ("my fav num " + num.to_s) 
puts num.abs() # absolute value
puts num.round()
puts num.ceil()
puts num.floor()
puts Math.sqrt(16) # use method from Math class
puts 1.0 + 7 # Implicit Type Casting


