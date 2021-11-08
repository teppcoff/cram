require 'rails_helper'

describe Notification do
  describe "#create" do

    it "factorybotが成功すること" do
      notification = build(:notification)
      expect(notification).to be_valid
    end

    it "visitor_idが必要であること" do
      notification = build(:notification, visitor_id: nil)
      expect(notification.valid?).to be_falsey
    end

    it "visited_idが必要であること" do
      notification = build(:notification, visited_id: nil)
      expect(notification.valid?).to be_falsey
    end

  end
end
