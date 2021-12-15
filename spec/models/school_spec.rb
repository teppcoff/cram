require 'rails_helper'

RSpec.describe School, type: :model do
  
  before do
    @school = FactoryBot.build(:school)
  end

  it "factorybotが成功すること" do
    expect(@school).to be_valid
  end

  it "nameが必要であること" do
    @school.name = " "
    expect(@school).to be_invalid
  end

  it "school_typeが必要であること" do
    @school.school_type = nil
    expect(@school).to be_invalid
  end

end
