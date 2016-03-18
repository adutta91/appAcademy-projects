
class Card
  attr_reader :value , :face_pos, :face_down
  def initialize(i_value)
    @value = i_value
    @face_down = "___"
  end

  def hide
    if @value == nil
      @value = "---"
    else
      @face_pos = :down
    end
  end

  def reveal
    @face_pos = :up
  end

  def to_s
    if @face_pos == :up
      @value.to_s.center(3)
    else
      @face_down
    end
  end

  def ==(card)
    if card != nil
      @value == card.value
    else
      false
    end
  end
end
