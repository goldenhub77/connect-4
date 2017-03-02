require_relative 'board'
require_relative 'player'
require_relative 'game'

#regular expression to accept a single word for a name
LETTERS_ONLY = /^[a-zA-Z]+$/
#regular expression that acepts only the input of y,r,yellow,or red for a game piece
PIECE_SELECTOR_CHECK = /^Y$|^R$|^YELLOW$|^RED$/
@players = []
winner = nil

def new_game
  puts "~~~ Welcome to Connect 4 ~~~\n\n"
  (1..2).each.with_index do |num|
    name = ""
    piece = ""
    name_in_use = nil
    while (name).index(LETTERS_ONLY).nil? || name_in_use

      print "Player #{num} enter your name => "
      name = gets.chomp
      if (name).index(LETTERS_ONLY).nil?
        puts "Invalid entry, try again!"
      elsif @players.any? {|player| player.name == name}
        name_in_use = true
        puts "Name already in use, try again!"
      else
        name_in_use = false
      end
    end
    if @players.size == 0
      while (piece).index(PIECE_SELECTOR_CHECK).nil?
        print "what color piece would you like (r/y/red/yellow)? => "
        piece = gets.chomp.upcase
        if (piece).index(PIECE_SELECTOR_CHECK).nil?
          puts "Invalid entry, try again!"
        end
      end
    else
      @players.each do |player|
        ("Y").include?(player.piece) ? piece = "R" : piece = "Y"
      end
    end
  @players << Player.new(name, piece)
  end
end

def set_game(winner = nil)
  @connect_4 = Game.new(@players, winner)
  @connect_4.show_board
  while @connect_4.winner?.nil?
    @connect_4.move
    @connect_4.show_board
  end
end

def end_game
  winner = @connect_4.winner?
  turns = @connect_4.turns
  puts "Winner is #{winner}"
  puts "The game took #{turns} turns"
  print "Do you want to play again (y/n)? => "
  play_again = gets.chomp.upcase
  if play_again == "Y"
    set_game(winner)
    end_game
  end
exit
end
# uncomment to call methods to start game
# new_game
# set_game
# end_game
