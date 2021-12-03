require 'rails_helper'

RSpec.describe Period, type: :model do
  
  before do
    @period = FactoryBot.build(:period)
  end

  it "factorybotが成功すること" do
    expect(@period).to be_valid
  end

  it "number_of_periodが必要であること" do
    @period.number_of_period = nil
    expect(@period).to be_invalid
  end

end
