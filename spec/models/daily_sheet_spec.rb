require 'rails_helper'

describe DailySheet do
  describe "#create" do

    it "factorybotが成功すること" do
      daily_sheet = build(:daily_sheet)
      expect(daily_sheet).to be_valid
    end

    it "periodが必要であること" do
      daily_sheet = build(:daily_sheet, period: nil)
      expect(daily_sheet.valid?).to be_falsey
    end

  end
end
