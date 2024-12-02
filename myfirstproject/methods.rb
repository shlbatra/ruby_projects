# Methods - perform 1 task

def sayhi(name, age = -1) # default value for age
  puts ("Hello " + name + ", you are " + age.to_s)
end

sayhi("sahil", 36)
sayhi("mike")

# Return statement with methods

def cube(x)
  return x * x * x, 70 # if not put return, then return last line by default
  5
  puts "program here if possible"
end
 
puts cube(3)[1] # with multiple values we get array