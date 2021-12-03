require 'rails_helper'

RSpec.describe Notification, type: :model do
  
  before do
    @notification = FactoryBot.build(:notification)
  end

  it "factorybotが成功すること" do
    expect(@notification).to be_valid
  end

  it "visitor_idが必要であること" do
    @notification.visitor_id = nil
    expect(@notification.valid?).to be_falsey
  end

  it "visited_idが必要であること" do
    @notification.visited_id = nil
    expect(@notification.valid?).to be_falsey
  end

end
