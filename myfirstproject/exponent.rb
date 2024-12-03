# base to raise power ex. 2^3

def pow(base_num, pow_num)
  result = 1
  pow_num.times do #|index| - not reqd
    result = result * base_num
  end
  return result
end

puts pow(10, 3)