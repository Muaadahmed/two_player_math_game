require './player'
require './question'
class Game 
  def initialize
    @player1 = Player.new("Max", 3)
    @player2 = Player.new("Ruby", 3)
    @players = [@player1, @player2].shuffle
  end

  def gameover 
    @player1.lives == 0 || @player2.lives == 0 ? true : false
  end

  def correct(input, actual)
    input == actual
  end

  def check (player, method)
    if !method
      puts "Umm...Try Again Please"
      player.lives -= 1 
    else
      puts "That is CORRECT!!!"
    end
  end

  def winner 
    @players.select {|player| player.lives > 0}
  end

  def display_winner(winning_player)
    puts "#{winning_player[0].name} wins with a score of #{winning_player[0].lives}/3"
    puts "----GAME OVER----"
    puts "play again sometime"
  end

  def round_score_board(player1, player2)
    puts "Max: #{player1}/3 vs Ruby: #{player2}/3"
  end

  def play 
    while !gameover do
      rotate_players = @players.rotate!
      current_player = rotate_players.first


      question = Question.new(current_player.name)
      num_1, num_2 = question.randomize
      question.display_question(num_1, num_2)
      sum = num_1 + num_2

      prompt = gets.chomp

      check(current_player, correct(prompt.to_i, sum))

      round_score_board(@player1.lives, @player2.lives)

      puts "----Next Player----"
    end
    display_winner(winner)
  end
end