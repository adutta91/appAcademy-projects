require_relative "Card"
require_relative "board"
require_relative "player"

class Game
  def initialize(player, size)
    @player = player
    @board = Board.new(size)
    @board.populate
  end

  def render
    puts ""
    @board.render
  end

  def play
    @player.recieve_dimension_of_board(@board.grid.length)

    until @board.won?
      render
      guess1 = guess_prompt

      guess2 = guess_prompt(guess1)
      hide_cards(guess1, guess2) unless valid_move?(guess1, guess2)

    end
  end

  def guess_prompt(in_guess = nil)
    @player.prompt
    guess = @player.make_guess(in_guess)
    until valid_guess?(guess)
      puts "Please guess again"
      guess = @player.make_guess
    end
    @board.reveal(guess)
    @player.receive_revealed_card(guess, @board[guess])
    render
    guess
  end

  def valid_move?(guess1, guess2)
    if @board[guess1] == @board[guess2]
      @player.receive_match(@board[guess1].value)
      true
    else
      false
    end
  end

  def hide_cards(guess1, guess2)
    @board[guess1].hide
    @board[guess2].hide
  end

  def valid_guess?(guess)
    @board.in_dimension?(guess) && @board.card_pos(guess) == @board[guess].face_down
  end



end

 bob = HumanPlayer.new("Bob")
 g = Game.new(bob, 4)

g.play
