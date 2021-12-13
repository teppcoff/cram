require 'rails_helper'

RSpec.describe DailySheet, type: :model do

  before do
    @daily_sheet = FactoryBot.build(:daily_sheet)
  end

  it "factorybotが成功すること" do
    expect(@daily_sheet).to be_valid
  end

  it "messageが必要であること" do
    @daily_sheet.message = nil
    expect(@daily_sheet).to be_invalid
  end

end
