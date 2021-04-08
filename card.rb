class Card
  attr_reader :value
  def initialize(value)
    @value = value
    @face_up = true
  end
end