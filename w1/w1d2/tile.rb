class Tile

  attr_reader :value, :given

  def initialize(value, given = false)
    @value = value
     @given = value != 0
  end

  def to_s
    value.to_s
  end

end

class Board
  attr_reader :grid
  def initialize(grid=Array.new)
    @grid = grid
  end

  def self.from_file(file_name)
    board = Board.new
    File.open(file_name).each_line do |line|
        board.grid << line.chomp.split("").map {|num| Tile.new(num.to_i)}
      end
    p board.grid
    board
  end

  def position
  end

  def render

  end

  def solved?

  end
end

class Game
  def initialize
  end

  def play

  end

  def solved?
  end

  def render
  end

  def prompt

  end
end

b = Board.from_file("sudoku1.txt")
