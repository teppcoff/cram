require 'rails_helper'

RSpec.describe Examination, type: :model do

  before do
    @examination= FactoryBot.build(:examination)
  end

  it "factoryが成功すること" do
    expect(@examination).to be_valid
  end

  it "nameが必要であること" do
    @examination.name = " "
    expect(@examination).to be_invalid
  end

end
