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

  it "emailが形式通りであること" do
    @staff_member.email = "abcodexample"
    expect(@staff_member).to be_invalid
  end

  it "family_nameが必要であること" do
    @staff_member.family_name = " "
    expect(@staff_member).to be_invalid
  end

  it "giben_nameが必要であること" do
    @staff_member.given_name = " "
    expect(@staff_member).to be_invalid
  end

  it "family_name_kanaが必要であること" do
    @staff_member.family_name_kana = " "
    expect(@staff_member).to be_invalid
  end

  it "giben_name_kanaが必要であること" do
    @staff_member.given_name_kana = " "
    expect(@staff_member).to be_invalid
  end

  it "family_name_kanaは全角のカタカナであること" do
    @staff_member.family_name_kana = "ﾔﾏﾀﾞ"
    expect(@staff_member).to be_invalid
  end

  it "given_name_kanaは全角のカタカナであること" do
    @staff_member.given_name_kana = "ﾔﾏﾀﾞ"
    expect(@staff_member).to be_invalid
  end

  it "genderが必要であること" do
    @staff_member.gender = nil
    expect(@staff_member).to be_invalid
  end

  it "passwordが必要であること" do
    @staff_member.password = " "
    expect(@staff_member).to be_invalid
  end

  it "password_confirmationが必要であること" do
    @staff_member.password_confirmation = " "
    expect(@staff_member).to be_invalid
  end

  it "passwordとpassword_confirmationが一致していること" do
    @staff_member.password_confirmation = "bassword"
    expect(@staff_member).to be_invalid
  end

  it "employment_statusが必要であること" do
    @staff_member.employment_status = nil
    expect(@staff_member).to be_invalid
  end
  
end
