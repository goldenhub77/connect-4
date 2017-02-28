require_relative 'board'
class Game
  attr_reader :players
  def initialize(players, winner = nil)
    @players = players
    @winner = winner
    if @winner.nil?
      @players.shuffle!
    else
      @players.sort! {|player| player.name <=> winner}
    end
  end

  def move

  end

  def calulate_board

  end

  def winner?

  end
end
