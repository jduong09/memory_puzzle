require_relative "card"
require_relative "board"
class Game
  def initialize
    @board = Board.new(5, 5)
    @player_name = create_player
  end

  def game_loop
    @board.populate
    @board.reveal_all
    puts "Take a look at the board, and memorize!"
    sleep(5)  
    @board.hide_all
    until game_over?
      take_turn
    end
  end

  def take_turn
    system("clear")
    @board.render
    puts "Choose a location to flip a card"
    puts "Row:"
    row = gets.chomp.to_i
    puts "Col:"
    col = gets.chomp.to_i
    card = @board.reveal(row, col)

    system("clear")
    @board.render
    puts "Where is the other #{card.value}?"
    puts "Row:"
    row = gets.chomp.to_i
    puts "Col:"
    col = gets.chomp.to_i
    other_card = @board.reveal(row, col)

    system("clear")
    @board.render

    if card == other_card
      puts "nice"
    else
      puts "lol u suck"
      sleep(5)
      card.hide 
      other_card.hide
    end
    
  end

  def game_over?
    if @board.won?
      return true
    else
      return false
    end
  end

  def create_player
    puts "What is your name, playa?"
    name = gets.chomp
  end
end