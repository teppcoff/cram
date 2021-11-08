require 'rails_helper'

describe Semester do
  describe "#create" do

    it "factorybotが成功すること" do
      semester = build(:semester)
      expect(semester).to be_valid
    end

    it "nameが必要であること" do
      semester = build(:semester, name: nil)
      expect(semester.valid?).to be_falsey
    end

  end
end
