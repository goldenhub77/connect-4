require_relative 'board'
require_relative 'player'
require_relative 'game'

#regular expression to accept a single word for a name
letters_only = /^[a-zA-Z]+$/
#regular expression that acepts only the input of y,r,yellow,or red for a game piece
piece_selector_check = /^Y$|^R$|^YELLOW$|^RED$/

@players = []


(1..2).each.with_index do |num|
  name = ""
  piece = ""
  name_in_use = nil
  while (name).index(letters_only).nil? || name_in_use

    print "Player #{num} enter your name => "
    name = gets.chomp
    if (name).index(letters_only).nil?
      puts "Invalid entry, try again!"
    elsif @players.any? {|player| player.name == name}
      name_in_use = true
      puts "Name already in use, try again!"
    else
      name_in_use = false
    end
  end
  if @players.size == 0
    while (piece).index(piece_selector_check).nil?
      print "what color piece would you like (r/y/red/yellow)? => "
      piece = gets.chomp.upcase
      if (piece).index(piece_selector_check).nil?
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
connect_4 = Game.new(@players)

require 'pry'
binding.pry
