class Game




  attr_accessor :fragment

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @fragment = ""

  end

  def read_in_dictionary(dict_file_name)
    @dictionary = File.readlines(dict_file_name).map(&:chomp)
  end


  def win?
    result = @dictionary.include?(@fragment)
    puts "Game Over: #{@fragment}" if result
    result
  end

  def play_round
    current_player = @player1

    while !win?
      take_turn(current_player)
      if current_player == @player1
        current_player = @player2
      else
        current_player = @player1
      end
    end

  end

  def take_turn(player)

    guess = player.get_guess
    while !valid_play?(guess)
      puts "Invalid play"
      guess = player.get_guess
    end

    puts fragment
  end

  def valid_play?(str)
    return false if !('a'..'z').include?(str)
    @fragment += str
    true
  end


  def substrings(string)
    subs = []
    for i in 0..string.length-1
      for j in i..string.length-1
        subs << string[i..j] unless subs.include?(string[i..j])
      end
    end
    subs
  end

  def subwords(word)
    words = []
    subs = substrings(word)
    subs.each do |word|
      words << word if @dictionary.include?(word)
    end
    words
  end

end

if __FILE__ == $PROGRAM_NAME
  require './player'
  player1 = Player.new("Matt")
  player2 = Player.new("Arjun")
  a = Game.new(player1, player2)
  a.read_in_dictionary('dictionary.txt')

  a.play_round
end


# puts "#{fragment} What is your guess?"
