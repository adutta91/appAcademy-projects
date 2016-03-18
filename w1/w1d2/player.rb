class ComputerPlayer
  attr_reader :name, :board, :list_found_cards

  def initialize(i_name="ComputerPlayer")
    @name = i_name
    @list_found_cards = []
  end

  def recieve_dimension_of_board(dimension)
    @board = Board.new(dimension)
  end

  def prompt
    puts "computer entering guess...."
  end

  def make_guess(in_guess = nil)
    @board.full? ? guess_full_board(in_guess) : fill_board
  end

  def fill_board
    pos = []
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |card, j|
        pos = [i, j] if card == nil
      end
    end
    pos
  end
  #we gotta make it intellegent
  def guess_full_board(in_guess = nil)
    pos = []
    if in_guess == nil
      @board.grid.each_with_index do |row, i|
        row.each_with_index do |card, j|
          pos = [i, j] if !@list_found_cards.include?(card.value)
        end
      end
    else
      @board.grid.each_with_index do |row, i|
        row.each_with_index do |card, j|
          pos = [i, j] if card == @board[in_guess] && [i,j] != in_guess
        end
      end
    end
    pos
  end

  def receive_revealed_card(pos, card)
    @board[pos] = Card.new(card.value)
    @board[pos].reveal
  end

  def receive_match(value)
    @list_found_cards << value
  end
end


class HumanPlayer
  attr_reader :name, :board

  def initialize(i_name)
    @name = i_name
  end
  # def recieve_board(board)
  #   @board = board
  # end
  def prompt
    puts "Please Enter a Postion, #{@name} #,#"
  end

  def make_guess(in_guess = nil)
    gets.chomp.split(",").map {|num| num.to_i}
  end

  def receive_revealed_card(pos, card)
  end

  def receive_match(value)
  end

  def recieve_dimension_of_board(dimension)
  end

end
