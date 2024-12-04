# Handle Exceptions using rescue
 
# num = 10 / 0 # ZeroDivisionError

# arr = [1,2,3,4] # TypeError
# arr["dogs"]

begin 
  arr = [1,2,3,4] # Specify rescue block for specific error
  arr["a"]
  num = 10 / 0 
rescue ZeroDivisionError
  puts "Division by 0 error"
rescue TypeError => e # store exception to variable e
  puts e
end