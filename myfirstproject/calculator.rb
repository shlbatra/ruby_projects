puts "Enter first number: "
num1 = gets.chomp().to_f # get it as string

puts "Enter operator (+ - * /): "
op = gets.chomp()

puts "Enter second number"
num2 = gets.chomp().to_f

if op  == "+"
  calc = num1 + num2
  puts ("Operation output is " + calc.to_s)
elsif op == "-"
  calc = num1 - num2
  puts ("Operation output is " + calc.to_s)
elsif op == "*"
  calc = num1 * num2
  puts ("Operation output is " + calc.to_s)
elsif op == "/"
  calc = num1 / num2
  puts ("Operation output is " + calc.to_s)
else
  puts "Invalid Operation"
end