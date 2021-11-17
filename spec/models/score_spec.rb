require 'rails_helper'

describe Score do
  describe "#create" do

    it "factorybotが成功すること" do
      score = build(:score)
      expect(score).to be_valid
    end

    it "emailが必要であること" do
      score = build(:score, point: nil)
      expect(score.valid?).to be_falsey
    end
    
  end
end
