class Card
  attr_reader :value, :face_up
  def initialize(value)
    @value = value
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def ==(card)
    if self.value == card.value
      return true
    else
      return false
    end
  end

end