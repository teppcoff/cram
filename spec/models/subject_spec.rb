require 'rails_helper'

RSpec.describe Subject, type: :model do
  
  before do
    @subject = FactoryBot.build(:subject)
  end

  it "factorybotが成功すること" do
    expect(@subject).to be_valid
  end

  it "nameが必要であること" do
    @subject.name = " "
    expect(@subject).to be_invalid
  end

end
