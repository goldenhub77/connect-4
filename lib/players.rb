class Player
  attr_reader :name, :piece
  def initialize(name, piece)
    @name = name
    if ["Y","R"].include?(piece)
      @piece = piece
    else
      @piece = nil
    end
  end
end
