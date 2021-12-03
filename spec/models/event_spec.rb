require 'rails_helper'

RSpec.describe Event, type: :model do
  
  before do
    @event = FactoryBot.build(:event)
  end

  it "factoryが成功すること" do
    expect(@event).to be_valid
  end

  it "titleが必要であること" do
    @event.title = " "
    expect(@event).to be_invalid
  end

end
