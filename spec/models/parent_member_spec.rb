require 'rails_helper'

RSpec.describe ParentMember, type: :model do

  before do
    @parent_member = FactoryBot.build(:parent_member)
  end

  it "factorybotが成功すること" do
    expect(@parent_member).to be_valid
  end

  it "emailが必要であること" do
    @parent_member.email = " "
    expect(@parent_member).to be_invalid
  end

  it "emailが形式通りであること" do
    @parent_member.email = "abcodexample"
    expect(@parent_member).to be_invalid
  end

  it "family_nameが必要であること" do
    @parent_member.family_name = " "
    expect(@parent_member).to be_invalid
  end

  it "giben_nameが必要であること" do
    @parent_member.given_name = " "
    expect(@parent_member).to be_invalid
  end

  it "family_name_kanaが必要であること" do
    @parent_member.family_name_kana = " "
    expect(@parent_member).to be_invalid
  end

  it "giben_name_kanaが必要であること" do
    @parent_member.given_name_kana = " "
    expect(@parent_member).to be_invalid
  end

  it "family_name_kanaは全角のカタカナであること" do
    @parent_member.family_name_kana = "ﾔﾏﾀﾞ"
    expect(@parent_member).to be_invalid
  end

  it "given_name_kanaは全角のカタカナであること" do
    @parent_member.given_name_kana = "ﾔﾏﾀﾞ"
    expect(@parent_member).to be_invalid
  end

  it "genderが必要であること" do
    @parent_member.gender = nil
    expect(@parent_member).to be_invalid
  end

  it "passwordが必要であること" do
    @parent_member.password = " "
    expect(@parent_member).to be_invalid
  end

  it "password_confirmationが必要であること" do
    @parent_member.password_confirmation = " "
    expect(@parent_member).to be_invalid
  end

  it "passwordとpassword_confirmationが一致していること" do
    @parent_member.password_confirmation = "bassword"
    expect(@parent_member).to be_invalid
  end

end
