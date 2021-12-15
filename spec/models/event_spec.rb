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

  it "starts_atが必要であること" do
    @event.starts_at = " "
    expect(@event).to be_invalid
  end

  it "ends_atが必要であること" do
    @event.ends_at = " "
    expect(@event).to be_invalid
  end

  it "staff_memberが必要であること" do
    @event.staff_member = nil
    expect(@event).to be_invalid
  end

  it "student_memberは不要であること" do
    @event.student_member = nil
    expect(@event).to be_valid
  end

  it "subjectが必要であること" do
    @event.subject = nil
    expect(@event).to be_invalid
  end

  it "periodが必要であること" do
    @event.period = nil
    expect(@event).to be_invalid
  end

end
