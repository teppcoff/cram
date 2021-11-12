require 'rails_helper'

describe Period do
  describe "#create" do

    it "factorybotが成功すること" do
      period = build(:period)
      expect(period).to be_valid
    end

    it "number_of_periodが必要であること" do
      period = build(:period, number_of_period: nil)
      expect(period.valid?).to be_falsey
    end

  end
end
