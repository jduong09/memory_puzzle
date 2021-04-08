require_relative "card.rb"

class Board
  attr_reader :grid, :cards
  def initialize(row, col)
    @row = row
    @col = col
    @grid = Array.new(@row) { Array.new(@col) {"-"} }
    @cards = []
  end

  def populate
    # need to add the outer row and outer column
    #outer row
    (0..@grid[0].length - 1).each do |idx|
      if idx == 0
        self[0, idx] = " "
      end

      self[0, idx] = idx.to_s
    end
    #outer column
    (1..@grid.length - 1).each do |row|
      self[row, 0] = row.to_s
    end
    
    #Amount of unique cards needed, then need double for board.
    numberOfCards = @row - 1

    generate_cards(numberOfCards)

    (1...@grid.length).each do |row|
      (1...@grid.length).each do |col|
        self[row, col] = @cards[-1]
        @cards.pop
      end
    end

    @grid
  end

  def generate_cards(num_of_cards)
    alphabet = ("A".."Z").to_a
    array_of_chosen_letters = []
    (num_of_cards * 2).times do |num|
      letter = alphabet.sample

      until !array_of_chosen_letters.include?(letter)
        letter = alphabet.sample
      end

      array_of_chosen_letters << letter

      @cards << Card.new(letter)
      @cards << Card.new(letter)
    end

    @cards.shuffle!
  end

  def render
    string = ""
    @grid.each do |row|
      row_string = ""
      row.each do |col|
        if col.is_a?(String) || col.is_a?(Integer)
          row_string += col + " " 
          next
        else
          if col.face_up == true
            row_string += col.value + " "
          else 
            row_string += " " + " "
          end
        end
      end
      row_string += "\n"
      string += row_string
    end
    puts string
  end

  def won?
  end

  def reveal(row, col)
    card = self[row, col]
    card.reveal
    render
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, value)
    @grid[row][col] = value
  end
end