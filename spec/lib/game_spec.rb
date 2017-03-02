require 'spec_helper'

RSpec.describe Game do
  let(:game){Game.new([Player.new("Sean","Y"),Player.new("Bill","R")], "Sean")}
  let(:board){
              [
                ["E", "E", "E", "E", "E", "E", "E"],
                ["E", "E", "E", "E", "E", "E", "E"],
                ["E", "E", "E", "E", "E", "E", "E"],
                ["E", "E", "E", "E", "E", "E", "E"],
                ["E", "E", "E", "E", "E", "E", "E"],
                ["E", "E", "E", "E", "E", "E", "E"]
              ]
            }
let(:board_move_2){
            [
              ["E", "E", "E", "E", "E", "E", "E"],
              ["E", "E", "E", "E", "E", "E", "E"],
              ["E", "E", "E", "E", "E", "E", "E"],
              ["E", "E", "E", "E", "E", "E", "E"],
              ["E", "E", "E", "E", "E", "E", "E"],
              ["E", "Y", "E", "E", "E", "E", "E"]
            ]
          }

let(:board_horizontal_win){
            [
              ["E", "E", "E", "E", "E", "E", "E"],
              ["E", "E", "E", "E", "E", "E", "E"],
              ["E", "E", "E", "E", "E", "E", "E"],
              ["E", "E", "E", "Y", "Y", "Y", "Y"],
              ["E", "E", "E", "R", "Y", "R", "R"],
              ["E", "E", "E", "Y", "R", "Y", "Y"]
            ]
          }
let(:board_vertical_win){
            [
              ["E", "E", "E", "E", "E", "E", "E"],
              ["E", "E", "E", "E", "E", "E", "E"],
              ["E", "Y", "E", "E", "E", "E", "E"],
              ["E", "Y", "R", "E", "E", "E", "E"],
              ["E", "Y", "R", "E", "E", "E", "E"],
              ["E", "Y", "R", "E", "E", "E", "E"]
            ]
          }
let(:filled_board){
            [
              ["Y", "R", "Y", "R", "Y", "R", "Y"],
              ["Y", "R", "Y", "R", "Y", "R", "Y"],
              ["Y", "R", "Y", "R", "Y", "R", "Y"],
              ["R", "Y", "R", "Y", "R", "Y", "R"],
              ["R", "Y", "R", "Y", "R", "Y", "R"],
              ["R", "Y", "R", "Y", "R", "Y", "R"]
            ]
          }
  it 'Game.new argument must be an array of players(connect_4 only should have 2 players)' do
    expect(game).to be_a_kind_of(Game)
  end
  it 'if there is a winner they should be first to play' do
    expect(game.prev_winner).to eq("Sean")
  end
  it '#move should return alternate player per turn depending on order of array' do
    expect(game.move(1)).to eq("Bill")
    expect(game.move(1)).to eq("Sean")
  end
  it 'initial grid should contain only "E" for empty spaces' do
    expect(game.board.grid).to eq(board)
  end
  it 'filled_board should return true when there are no empty space and false otherwise' do
    game.board.grid = filled_board
    expect(game.board_filled?).to eq(true)
    game.board.grid = board
    expect(game.board_filled?).to eq(false)
  end
  it 'vertical board should result in Bill winning' do
    game.board.grid = board_vertical_win
    expect(game.winner?).to eq("Sean")
  end
  it 'horizontal board should result in Sean winning' do
    game.board.grid = board_horizontal_win
    expect(game.winner?).to eq("Sean")
  end
  it '#move(2) should set grid index 1 of last row to "Y"' do
    game.board.grid = board
    game.move(2)
    expect(game.board.grid).to eq(board_move_2)
  end
end
