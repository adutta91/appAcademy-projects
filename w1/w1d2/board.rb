require_relative "Card"

class Board
  attr_reader :grid

  def initialize(size=4)
    @grid = Array.new(size){Array.new(size)}
  end

  def populate
    num_boxes = @grid.length * @grid.length / 2
    pairs = (1..num_boxes).to_a.shuffle + (1..num_boxes).to_a.shuffle
    @grid.each_with_index do |row, i|
      row.each_index do |i2|
        @grid[i][i2] = Card.new(pairs.pop)
      end
    end
  end

  def render
    header ="_|"
    (0...@grid.length).each { |num| header << "_#{num}_|"}
    puts header
    @grid.each_with_index do |row,i|
      pr_row= "#{i}|"
      row.each do |card|
        pr_row << card.to_s + "|"
      end
      puts pr_row
    end
  end

  def won?
    @grid.each do |row|
      row.each do |card|
        return false if card.to_s == card.face_down
      end
    end
  end

  def full?
    result = true
    @grid.each do |row|
      row.each do |card|
        return false if card == nil
      end
    end
  end

  def reveal(pos)
    self[pos].reveal
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos, card)
    x,y = pos
    @grid[x][y] = card
  end

  def card_pos(guess)
    self[guess].to_s
  end

  def in_dimension?(pos)
    pos.all? { |num| num < @grid.length }
  end

end
