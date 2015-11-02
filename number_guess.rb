num = rand(10)
correct = false
while !correct
    puts "Please enter your guess: "
    guess = gets.to_i
    correct = true if num == guess
    puts "Too high" if num < guess
    puts "Too low" if num > guess
end

