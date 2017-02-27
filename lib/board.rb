class Board
  attr_reader :grid
  def initialize(rows = 6, cols = 7)
    @rows = rows
    @cols = cols
    @grid = build_board
  end

  def build_board
    board = []
    @rows.times do
      rows = []
      @cols.times do
        rows << nil
      end
      board << rows
    end
    board
  end

  def print_board
    board = ""
    border = "| "
    @grid.each.with_index do |row, r_index|
      board += border
      row.each.with_index do |col, c_index|
         board += "E "
      end
      board += border + "\n"
    end
    border.size.times do
      board += " "
    end
    (1..@cols).each do |num|
      board += "#{num} "
    end
    board
  end
end
