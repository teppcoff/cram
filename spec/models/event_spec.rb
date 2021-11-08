require 'rails_helper'

describe Event do
  describe "#create" do

    it "factoryが成功すること" do
      event = build(:event)
      expect(event).to be_valid
    end

    it "titleが必要であること" do
      event = build(:event, title: nil)
      expect(event.valid?).to be_falsey
    end
    
  end
end
