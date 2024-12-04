# Classes - represent information (custom datatype) ex. person
# Ruby everything is an object ex. string, number, boolean

class Book

  attr_accessor :title, :author, :pages  # attributes

  def initialize(title, author, pages)
    puts "Creating Book"
    @title = title # @title -> refer title of object = title parameter 
    @author = author
    @pages = pages
  end

end

# object - instance of class

# book1 = Book.new()
# book1.title = "Harry Potter"
# book1.author = "JK Rowling"
# book1.pages = 400

# Use initialize method when object is created
book1 = Book.new("Harry Potter", "JK Rowling", 400) # everytime new called initialize method called
 
puts book1.title

# book2 = Book.new()
# book2.title = "Lord of the rings"
# book2.author = "Tolkein"
# book2.pages = 500
book2 = Book.new( "Lord of the rings", "Tolkein", 500)
puts book2.author


# Another example - Object Methods

class Student
  attr_accessor :name, :major, :gpa
  def initialize(name, major, gpa)
    @name = name
    @major = major
    @gpa = gpa
  end

  def has_honors
    if @gpa >= 3.5
      return true
    end
    return false
  end
end
    


student1 = Student.new("a","business",2.6)
student2 = Student.new("b","art",3.6)

puts student1.has_honors
puts student2.has_honors
