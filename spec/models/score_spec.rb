require 'rails_helper'

RSpec.describe Score, type: :model do

  before do
    @score = FactoryBot.build(:score)
  end

  it "factorybotが成功すること" do
    expect(@score).to be_valid
  end

  it "pointが必要であること" do
    @score.point = nil
    expect(@score).to be_invalid
  end

end
