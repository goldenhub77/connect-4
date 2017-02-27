require 'colorize'
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
      board += border.colorize(:blue)
      row.each.with_index do |col, c_index|
         board += "E ".colorize(:green)
      end
      board += border.colorize(:blue) + "\n"
    end
    border.size.times do
      board += " "
    end
    (1..@cols).each do |num|
      board += "#{num} ".colorize(:magenta)
    end
    board
  end
end
