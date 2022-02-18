#generate 4 digit master code
code = []
4.times { code += [rand(5) + 1] }

#use below code for debugging only
#code = [1,2,3,4]

#clear the terminal
system("cls")

#TODO add instructions on how to play the game
puts "Welcome to Mastermind, a codebreaking game! In this game, you will attempt
to guess the code created by the computer. This code is 4 numbers long and made
up of digits from 1 to 6. After you guess a code, the game will provide you with
feedback on how close your code was to being correct. This feedback is composed
of two numbers. The first number indicates how many of your guessed numbers match
and are in the correct positions. The second number shows you how many of your
guessed numbers are in the code, but not the correct position. If you guess
correctly within 10 tries, you win!
Good luck!"

round = 0
#start the game already! Game lasts 10 rounds, uses round variable to track
until round ==10 do

code_copy = []
guess = []
guess_copy = []
feedback = [0,0]

#copy the master code so we can make changes during feedback
code.each do |value|
  code_copy += [value]
end

#request input from user and sanitize it
puts "Please type four numerals from 1 to 6"
input = gets.chomp.chars
new_input = []
input.each do |value|
  if value.to_i >= 1 and value.to_i <= 6
    new_input << value.to_i
  end
end
#if there are too few digits, add 0s to fill the array to 4 units
new_input += [0,0,0,0]
guess = new_input[0..3]

#copy the guess so we can make changes during feedback
guess.each do |value|
  guess_copy += [value]
end

=begin
go through each index value. For each match, add a "b" to the
feedback array. Then set both the values to 0 so we know we've
already considered that match
=end
guess_copy.each_with_index do |value, index|
	if code_copy[index] == value
		feedback[0] += 1
		code_copy[index] = 0
		guess_copy[index] = 0
	end
end

=begin
Go through both arrays. Skip any 0s. If there is a match, add
a "w" to the feedback array. Then set both values to 0 so we
don't reevaluate it
=end
guess_copy.each_with_index do |guess_value, guess_index|
  if guess_value == 0
    next
  end
  code_copy.each_with_index do |code_value, code_index|
    if code_value == 0 or guess_value == 0
      next
    end
    if guess_value == code_value
      feedback[1] += 1
	      	guess_copy[guess_index] = 0
          code_copy[code_index] = 0
          code_value = 0
          guess_value = 0
    end
  end
end

#TODO polish display for user

#display guess and feedback for user.
puts "#{guess} #{feedback}"

#is the guess correct?
if feedback == [4,0]
  puts "Congratulations! You win!"
  break
end

#repeat
round += 1
end

#display actual master code
puts "Actual code is #{code}"
