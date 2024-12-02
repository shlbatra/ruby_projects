# Array

friends = Array["a","b","c"] # support diff types
#puts friends
puts friends[2]
puts friends[-2]
puts friends[0, 2]
friends[0] = 'd'
puts friends
puts friends.length
puts friends.include? "d"
puts friends.reverse()
puts friends.sort() # Not work on mix types
friends = Array.new # Not know size
friends[0] = 'e'
friends[5] = 'g'

puts friends

# Hash - key value pairs with unique keys 
puts "Hashes"
states = {
  :Pennsylvania => "PA",
  "California" => "CA",
  "New York" => "NY"
}

puts states
puts states["California"]
puts states[:Pennsylvania]
puts states[1]