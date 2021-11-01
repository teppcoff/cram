require 'rails_helper'

describe DailySheet do
  describe "#create" do

    it "factorybotが成功すること" do
      daily_sheet = build(:daily_sheet)
      expect(daily_sheet).to be_valid
    end
  end
end
