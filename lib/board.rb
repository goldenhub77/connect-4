class Board
  attr_accessor :grid
  COLS = 7
  ROWS = 6

  def initialize
    @grid = build_board
  end

  def build_board
    board = []
    ROWS.times do
      rows = []
      COLS.times do
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
    (1..COLS).each do |num|
      board += "#{num} "
    end
    board
  end
end
