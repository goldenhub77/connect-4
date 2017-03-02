require 'spec_helper'

RSpec.describe Board do
  let(:default_board){Board.new}
  let(:custom_board){Board.new(4,5)}

  it 'must initialize a 6row 7col array of arrays when no argument is provided' do
    expect(default_board).to be_a_kind_of(Board)
    expect(default_board.grid).to be_a_kind_of(Array)
    expect(default_board.grid.size).to eq(6)
    expect(default_board.grid.first.size).to eq(7)
  end
  it 'can accept 2 arguments Board.new(cols, rows)' do
    expect(custom_board.grid.size).to eq(4)
    expect(custom_board.grid.first.size).to eq(5)
  end

  it '#print_board must display default or user entered grid to terminal' do
    default_output = "| E E E E E E E | \n| E E E E E E E | \n| E E E E E E E | \n| E E E E E E E | \n| E E E E E E E | \n| E E E E E E E | \n  1 2 3 4 5 6 7 "
    custom_output = "| E E E E E | \n| E E E E E | \n| E E E E E | \n| E E E E E | \n  1 2 3 4 5 "
        expect(default_board.print_board.uncolorize).to eq(default_output)
        expect(custom_board.print_board.uncolorize).to eq(custom_output)
  end

end
