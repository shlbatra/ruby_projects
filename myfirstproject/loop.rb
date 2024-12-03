# while loops

index = 1
while index <= 5
  puts index
  index += 1
end

# for loop - loop through collection

friends = ["a","b","c","d"]
 
for friend in friends
  puts friend
end

# do loop

friends.each do |friend|
  puts friend
end 

# loop through specific number

for index in 0..5
  puts index
end

# loop in another way

6.times do |index|
  puts index
end