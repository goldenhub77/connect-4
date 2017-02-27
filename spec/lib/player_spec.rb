require 'spec_helper'

RSpec.describe Player do
  let(:player_one){Player.new('Sean', 'Y')}
  let(:player_two){Player.new('Joe', 'R')}
  let(:player_invalid_argument){Player.new('Joe', 'random input')}
  let(:error_player){Player.new}
  it 'player takes 2 arguments' do
    expect{error_player}.to raise_error(ArgumentError)
  end
  it 'player_one.name equals "Sean"' do
    expect(player_one.name).to eq("Sean")
  end
  it 'player_one.piece equals "Y"' do
    expect(player_one.piece).to eq("Y")
  end
  it 'error_player_invalid_entry should raise_error' do
    expect(player_invalid_argument.piece).to eq(nil)
  end
end
