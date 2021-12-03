require 'rails_helper'

RSpec.describe StudentMember, type: :model do

  before do
    @student_member = FactoryBot.build(:student_member)
  end

  it "factorybotが成功すること" do
    expect(@student_member).to be_valid
  end

  it "emailが必要であること" do
    @student_member.email = " "
    expect(@student_member).to be_invalid
  end

  it "given_name_kanaは全角カタカナであること" do
    @student_member.given_name_kana = "ﾀﾛｳ"
    expect(@student_member).to be_invalid
  end
    
end
