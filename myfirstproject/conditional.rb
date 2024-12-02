# if / if else conditional

ismale = false
istall = false

if ismale and istall # or keyword
  puts "you are tall male"
elsif ismale and !istall
  puts "you are short male"
elsif !ismale and istall
  puts "you are not male and tall"
else
  puts "you are neither male nor tall"
end

# if statements with comparisons

def max(num1, num2, num3)
  if num1 >= num2 and num1 >= num3   # compare strings as well
    return num1
  elsif num2 >= num1 and num2 >= num3
    return num2
  else
    return num3
  end
end

puts max(10, 7, 1)

# case statements 

def get_day_name(day)
  day_name = ""
  case day 
  when "mon" 
    day_name = "Monday"
  when "tue"
    day_name = "Tuesday"
  when "wed"
    day_name = "Wednesday"
  when "thur"
    day_name = "Thursday"
  when "fri"
    day_name = "Friday"
  when "sat"
    day_name = "Saturday"
  when "sun"
    day_name = "Sunday"
  else
    day_name = "Invalid abbreviation"
  end
return day_name
end

puts get_day_name("fri")
puts get_day_name("friaa")