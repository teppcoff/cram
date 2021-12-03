require 'rails_helper'

RSpec.describe ScoreSheet, type: :model do
  
  before do
    @score_sheet = FactoryBot.build(:score_sheet)
  end

  it "factorybotが成功すること" do
    expect(@score_sheet).to be_valid
  end

end
