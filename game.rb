require_relative "card"
require_relative "board"
class Game
  #How to play
    #Game is over when player has flipped all the cards.
      # Each turn:
        # Prompt player to choose a card to flip
          # Confirm that the card is a new card/not a location they have already solved
            # Once they have chosen a new card to flip and guess its twin's location
              # Flip the card so they see the value of the card
                # Flip the card back so they don't see the value of the card
                # Prompt the player to choose where the card's twin is.
                  # Check if they are right.
  def initialize
    @board = Board.new(5, 5)
    @player_name = create_player
  end

  def game_loop
    @board.populate
    @board.render
    take_turn
  end

  def take_turn
    puts "Choose a location to flip a card"
    puts "Row:"
    row = gets.chomp.to_i
    puts "Col:"
    col = gets.chomp.to_i
    @board.reveal(row, col)
  end

  def create_player
    puts "What is your name, playa?"
    name = gets.chomp
  end
end