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

  it "emailが形式通りであること" do
    @student_member.email = "abcodexample"
    expect(@student_member).to be_invalid
  end

  it "family_nameが必要であること" do
    @student_member.family_name = " "
    expect(@student_member).to be_invalid
  end

  it "giben_nameが必要であること" do
    @student_member.given_name = " "
    expect(@student_member).to be_invalid
  end

  it "family_name_kanaが必要であること" do
    @student_member.family_name_kana = " "
    expect(@student_member).to be_invalid
  end

  it "giben_name_kanaが必要であること" do
    @student_member.given_name_kana = " "
    expect(@student_member).to be_invalid
  end

  it "family_name_kanaは全角のカタカナであること" do
    @student_member.family_name_kana = "ﾔﾏﾀﾞ"
    expect(@student_member).to be_invalid
  end

  it "given_name_kanaは全角のカタカナであること" do
    @student_member.given_name_kana = "ﾔﾏﾀﾞ"
    expect(@student_member).to be_invalid
  end

  it "genderが必要であること" do
    @student_member.gender = nil
    expect(@student_member).to be_invalid
  end

  it "passwordが必要であること" do
    @student_member.password = " "
    expect(@student_member).to be_invalid
  end

  it "password_confirmationが必要であること" do
    @student_member.password_confirmation = " "
    expect(@student_member).to be_invalid
  end

  it "passwordとpassword_confirmationが一致していること" do
    @student_member.password_confirmation = "bassword"
    expect(@student_member).to be_invalid
  end
    
  it "school_typeが必要であること" do
    @student_member.school_type = nil
    expect(@student_member).to be_invalid
  end

  it "school_yearが必要であること" do
    @student_member.school_year = nil
    expect(@student_member).to be_invalid
  end

  it "parent_memberが必要であること" do
    @student_member.parent_member = nil
    expect(@student_member).to be_invalid
  end
  
end
