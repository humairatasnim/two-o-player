class Game

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @player1.turn = true
  end

  def start
    while @player1.lives > 0 && @player2.lives > 0
      puts "----- NEW TURN -----"
      round = Question.new
      @question = round.question
      @answer = round.answer
      if @player1.turn
        puts "Question for Player 1: #{@question}"
      else
        puts "Question for Player 2: #{@question}"
      end
      check_answer
    end
  end

  def check_answer
    if gets.chomp.to_i == @answer
      puts "Correct answer!"
    else
      puts "Wrong answer!"
      if @player1.turn
        @player1.lives -= 1
      else
        @player2.lives -= 1
      end     
    end
    puts "Player 1: #{@player1.lives}/3 vs Player 2: #{@player2.lives}/3"
    check_winner
    switch_turn
  end

  def switch_turn
    if @player1.turn
      @player1.turn = false
      @player2.turn = true
    else
      @player2.turn = false
      @player1.turn = true
    end
  end

  def check_winner
    if @player1.lives <= 0
      puts "----- GAME OVER -----"
      puts "Player 2 wins with a score of #{@player2.lives}/3"
    elsif @player2.lives <= 0
      puts "----- GAME OVER -----"
      puts "Player 1 wins with a score of #{@player1.lives}/3"
    end
  end

end