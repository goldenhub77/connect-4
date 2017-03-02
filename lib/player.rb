require 'colorize'
class Player
  attr_reader :name, :piece
  def initialize(name, piece)
    @name = name.capitalize
    @piece = piece.upcase
    if (@piece).index(/^Y$|^R$|^YELLOW$|^RED$/).nil?
      @piece = nil
    elsif (@piece).index(/^YELLOW$/)
      @piece = "Y"
    elsif (@piece).index(/^RED$/)
      @piece = "R"
    end
  end
end
