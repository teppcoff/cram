require 'rails_helper'

describe Subject do
  describe "#create" do

    it "factorybotが成功すること" do
      subject = build(:subject)
      expect(subject).to be_valid
    end

    it "nameが必要であること" do
      subject = build(:subject, name: nil)
      expect(subject.valid?).to be_falsey
    end

  end
end
