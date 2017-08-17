require 'pry'

class MasterMind

  attr_reader :answer, :guess_input, :time

  def initialize
    @count = 0
    @answer = "rgby".split("").shuffle.join
    @guess_input = guess_input
    @time = Time.now
  end


  def welcome_message
    @time = Time.now
    p "Welcome to MASTERMIND"
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
      user_input = gets.chomp.downcase
        if user_input == "p"
            initiate_game
        elsif user_input == "i"
            display_instructions
        elsif user_input == "q"
            quit_game
        else
            p "Invalid response"
            welcome_message
        end
    end

  def display_instructions
    p "The game has generated a sequence with four elements made of :(r)ed, (g)reen, (b)lue, and (y)ellow. You can guess the sequence of the elements by inputting a guess in this format (Ex: rrgb). The computer will then tell you how many of the correct elements you've guessed with the number of elements you've guessed in the correct sequence. It'll then notify you how many guesses you've taken and will ask you to guess again."
    welcome_message
  end

  def quit_game
    p "You've exited the game"
    exit
  end

  def initiate_game
    p "I have generated a beginner sequence with four elements made up of: (r)ed,(g)reen,(b)lue,and (y)ellow.Use (q)uit at any time to end the game. What's your guess?"
    @guess_input = gets.chomp.downcase
      @count += 1
      if guess_input == "q"
          quit_game
      elsif guess_input == "c"
        p "The answer has all four elements"
          initiate_game
      elsif guess_input.length < 4
        p "Your answer isn't long enough!"
          initiate_game
      elsif guess_input.length > 4
        p "Your answer is too long!"
          initiate_game
      elsif guess_input == @answer
        p "Congratulations! You've guessed the sequence properly!"
        finished_game_try_again
      else guess_input != @answer
        p "Wrong Answer! #{guess_input} has #{answer_count} of the correct elements with #{count_answer} in the correct position"
        p "You've taken #{@count} guess"
          answer_comparison
          initiate_game
      end
  end

  def answer_comparison
    nested_array = guess_array.zip(answer_array)
    compare_answer = nested_array.map do |word, value|
      if word == value
        true
      else
        false
      end
    end
  end

  def guess_array
    @guess_input.split("")
  end

  def answer_array
    @answer.split("")
  end

  def count_answer
    answer_comparison.count(true)
  end

  def answer_element_comparison
    guess_array & answer_array
  end

  def answer_count
    answer_element_comparison.count
  end

  def finished_game_try_again
    t2 = Time.now
    minutes = t2 - @time
    p "Congratulations! You finished in #{time}"
    p "Do you want to (p)lay again or (q)uit?"
      try_again_input = gets.chomp.downcase
        if try_again_input == "p"
          initiate_game
        else try_again_input == "q"
          quit_game
        end
  end

end


mastermind = MasterMind.new
mastermind.welcome_message

#comment
