require 'rails_helper'

describe School do
  describe "#create" do

    it "factorybotが成功すること" do
      school = build(:school)
      expect(school).to be_valid
    end

    it "nameが必要であること" do
      school = build(:school, name: nil)
      expect(school.valid?).to be_falsey
    end

  end
end
