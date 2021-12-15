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

  it "nameは20文字以下であること" do
    @examination.name = "a" * 21
    expect(@examination).to be_invalid
  end

  it "academic_yearが必要であること" do
    @examination.academic_year = " "
    expect(@examination).to be_invalid
  end

  it "academic_yearは2000-2100の間であること" do
    @examination.academic_year = 3000
    expect(@examination).to be_invalid
  end

  it "school_idが必要であること" do
    @examination.school = nil
    expect(@examination).to be_invalid
  end

end
