module Snackbar # module allows for grouping related constants and methods, namespace for related code that doesnt belong to class
  Snack = Data.define(:name, :price) #dataclass
  SNACKS = [
    Snack.new("popcorn", 3),
    Snack.new("candy", 1),
    Snack.new("nachos", 4),
    Snack.new("pretzels", 2)
  ]

  def self.random_snack  # Module method, value of self is Snackbar module
    SNACKS.sample
  end
end