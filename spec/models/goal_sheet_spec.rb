require 'rails_helper'

describe GoalSheet do
  describe "#create" do

    it "number_of_lessonsが必要であること" do
      goal_sheet = build(:goal_sheet, number_of_lessons: nil)
      expect(goal_sheet.valid?).to be_falsey
    end

    it "nameが必要であること" do
      goal_sheet = build(:goal_sheet, name: nil)
      expect(goal_sheet.valid?).to be_falsey
    end
  end
end
