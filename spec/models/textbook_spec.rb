require 'rails_helper'

describe Textbook do
  describe "#create" do

    it "factorybotが成功すること" do
      textbook = build(:textbook)
      expect(textbook).to be_valid
    end

    it "text_typeが必要であること" do
      textbook = build(:textbook, text_type: nil)
      expect(textbook.valid?).to be_falsey
    end

  end
end
