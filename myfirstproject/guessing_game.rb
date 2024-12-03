# user guess a secret word continously till that get it right

secret_word = "hello"
guess = ""
guess_count = 0
guess_limit = 3
out_of_guesses = false

while guess != secret_word and !out_of_guesses
  if guess_count <= guess_limit
    puts "Enter Your Guess: "
    guess =  gets.chomp() # remove new line after with chomp
    guess_count += 1
  else
    out_of_guesses = true
  end
end

if out_of_guesses
  puts "You are out of guesses !"
else
  puts "You guess right !"
end