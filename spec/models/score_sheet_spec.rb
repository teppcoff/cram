require 'rails_helper'

describe ScoreSheet do
  describe "#create" do

    it "factorybotが成功すること" do
      score_sheet = build(:score_sheet)
      expect(score_sheet).to be_valid
    end

  end
end
