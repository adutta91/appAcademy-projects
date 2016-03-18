class Player

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_guess
    puts "What is your guess?"
    guess = gets.chomp
    guess[0].downcase
  end

end
