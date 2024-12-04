# Extend functionality of class to sub classes

class Chef # super class
  def make_chicken
    puts "The chef makes chicken"
  end

  def make_salad
    puts "The chef makes salad"
  end

  def make_special_dish
    puts "The chef makes bbq dish"
  end

end

# Italian chef inherit all functionality from Chef class
class ItalianChef < Chef # sub class
  def make_special_dish # override method here
    puts  "The chef makes eggplant parm"
  end

  def make_pasta # entend functionality unique to sub class
    puts "The chef makes Pasta"
  end

end

chef = Chef.new()
chef.make_chicken
chef.make_special_dish

italian_chef = ItalianChef.new()
italian_chef.make_salad
italian_chef.make_special_dish
italian_chef.make_pasta