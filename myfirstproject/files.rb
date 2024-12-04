
# Read File

File.open("data/employees.txt", "r") do |file| # name of file, file mode to open file ex. r (read), 
  puts file # Print memory location of file
  text = file.read()
  puts text.include? "Manager"
end

File.open("data/employees.txt", "r") do |file| 
  puts file.readline() # print first line and then continous
  puts file.readchar()
end

File.open("data/employees.txt", "r") do |file| 
  for line in file.readlines() # 
    puts line # string as each line
  end
end

file = File.open("data/employees.txt", "r")

puts file.read()

file.close()

# Write File

# Append to existing file

File.open("data/employees.txt", "a") do |file| 
  file.write("\nF, Accounting")
end

# Overwrite or create new file
File.open("data/employees1.txt", "w") do |file| 
  file.write("\nF, Accounting1")
end

File.open("data/index.html", "r+") do |file|  # read and write
  file.write("<h1>Hello</h1>")
end


File.open("data/index.html", "r+") do |file|  # read and write
  file.readline() # move cursor to second line
  file.write("\n<h1>Overwrite</h1>")
end