require 'rails_helper'

RSpec.describe StaffMember, type: :model do

  before do
    @staff_member = FactoryBot.build(:staff_member)
  end

  it "factorybotが成功すること" do
    expect(@staff_member).to be_valid
  end

  it "emailが必要であること" do
    @staff_member.email = " "
    expect(@staff_member).to be_invalid
  end

  it "family_name_kanaは全角カタカナであること" do
    @staff_member.family_name_kana = "ﾔﾏﾀﾞ"
    expect(@staff_member).to be_invalid
  end
  
end
