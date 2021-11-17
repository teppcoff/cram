require 'rails_helper'

describe Examination do
  describe "#create" do

    it "factoryが成功すること" do
      examination = build(:examination)
      expect(examination).to be_valid
    end

    it "nameが必要であること" do
      examination = build(:examination, name: nil)
      expect(examination.valid?).to be_falsey
    end
    
  end
end
