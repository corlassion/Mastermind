# frozen_string_literal: true
require "pry"

module MastermindCorlassion
  class MainRunner

  INSTRUCTIONS = "Welcome to Mastermind, a codebreaking game! In this game, you will attempt
to guess the code created by the computer. This code is 4 numbers long and made
up of digits from 1 to 6. After you guess a code, the game will provide you with
feedback on how close your code was to being correct. This feedback is composed
of two numbers. The first number indicates how many of your guessed numbers match
and are in the correct positions. The second number shows you how many of your
guessed numbers are in the code, but not the correct position. If you guess
correctly within 10 tries, you win!
Good luck!"

    class << self
      def run
        new.run
      end
    end

    def initialize
      #generate 4 digit master code
      @code = []
      4.times { @code += [rand(5) + 1] }

      #use below code for debugging only
      #@code = [1,2,1,1]

    end

    def run
      #clear the terminal
      system("cls")

      #instructions on how to play the game
      puts INSTRUCTIONS

      round = 0
      #start the game already! Game lasts 10 rounds, uses round variable to track
      until round ==10 do

        #request input from user and sanitize it
        guess = get_input

        feedback = feedback_logic(guess, @code)
        #TODO instead push to new row in history

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
      puts "The actual code was #{@code}"
    end

    def get_input
      input = []
      until input.length==4
        puts "Please type four numerals from 1 to 6"
        input = gets.chomp.tr('^1-6', '').chars.map(&:to_i)
      end
      input
    end

    def feedback_logic(guess, code)
      unique_totals_by_value = {}
      unique_matches_by_value = {}

      guess.each_with_index do |value,index|
        if code[index] == value
          unique_matches_by_value[value] ||= 0
          unique_matches_by_value[value] += 1
        end
        if (values_total = code.count(value)) > 0
          unique_totals_by_value[value] ||= 0
          unique_totals_by_value[value] += 1 if unique_totals_by_value[value] < values_total
        end
      end

      close = unique_totals_by_value.map do |value, total|
        result = total - (unique_matches_by_value[value]||0)
        [result,0].max
      end.sum
      match = unique_matches_by_value.values.sum

      [match, close]
    end

  end
end
