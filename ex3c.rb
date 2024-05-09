def guess_the_number
  secret_number = rand(1..100)
  guesses_left = 10

  puts "Welcome to Guess the Number game!"
  puts "I have selected a random number between 1 and 100. You have 10 guesses to find it."

  while guesses_left > 0
    puts "You have #{guesses_left} guesses left."
    print "Enter your guess: "
    guess = gets.chomp.to_i

    if guess == secret_number
      puts "Congratulations! You guessed the number #{secret_number} correctly!"
      return
    elsif guess < secret_number
      puts "Too low! Try again."
    else
      puts "Too high! Try again."
    end

    guesses_left -= 1
  end

  puts "Sorry, you're out of guesses! The correct number was #{secret_number}."
end

# Call the method
guess_the_number
