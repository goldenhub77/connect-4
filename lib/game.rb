require_relative 'board'
class Game
  attr_reader :players, :board, :prev_winner, :turns
  def initialize(players, prev_winner = nil)
    @players = players
    @prev_winner = prev_winner
    @board = Board.new
    @turn_index = 0
    @turns = 0
    if self.prev_winner.nil?
      @players.shuffle!
    else
      @players.sort! {|player| player.name <=> self.prev_winner}
    end
  end

  def switch_players
    @turn_index == 0 ? @turn_index = 1 : @turn_index = 0
  end

  def move(selection = nil)
    if !board_filled?
      turn = {name: @players[@turn_index].name}
      while  selection.nil? || check_board(selection)
        print "#{turn[:name]}, what column would you like to place your piece? => "
        selection = gets.chomp.to_i
      end
      if winner?.nil?
        switch_players
      end
    end
    @players[@turn_index].name
  end

  def show_board
    puts "\n" + board.print_board
  end

  def check_board(column)
    row_filled_spaces = 0
    @turns += 1
    @board.grid.reverse.each.with_index do |row, index|
      if row[column-1] != "E"
        row_filled_spaces += 1
      end
    end
    if !column.between?(1, board.cols)
      puts "Column doesn't exist!"
      true
    elsif row_filled_spaces == @board.grid.size
      puts "Column is full, try again!"
      true
    elsif winner?.nil?
      update_board(column)
      false
    end
  end

  def update_board(column)
    @board.grid.reverse.each.with_index do |row, index|
      if row[column-1] == "E"
        row[column-1] = @players[@turn_index].piece
        break
      end
    end
  end

  def check_horizontals
    piece_count = 0
    max_piece_count = 0
    @board.grid.reverse.each do |row|
      row.each do |piece|
        if  piece == @players[@turn_index].piece
          piece_count += 1
        else
          max_piece_count = piece_count if piece_count > max_piece_count
          piece_count = 0
        end
      end
    end
    if max_piece_count >= 4
      self.game_winner = @players[@turn_index].name
    end
  end

  def check_verticals
    piece_count = 0
    max_piece_count = 0
    @board.grid.transpose.reverse.each do |row|
      row.reverse.each do |piece|
        if piece == @players[@turn_index].piece
          piece_count += 1
        else
          max_piece_count = piece_count if piece_count > max_piece_count
          piece_count = 0
        end
      end
    end
    if max_piece_count >= 4
      self.game_winner = @players[@turn_index].name
    end
  end

  def board_filled?
    empty_spaces = 0
    @board.grid.each do |row|
      row.each do |piece|
        if piece == "E"
          empty_spaces += 1
        end
      end
    end
    empty_spaces == 0
  end

  # def check_diagonals
  #
  # end

  def winner?
    self.game_winner = nil
    check_horizontals
    check_verticals
    # check_diagonals
    if board_filled?
      self.game_winner = "Tied"
    end
    @game_winner
  end

  private :update_board, :check_board, :switch_players
  attr_writer :game_winner

end
