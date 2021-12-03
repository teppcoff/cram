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

  it "family_name_kanaは全角のカタカナであること" do
    @parent_member.family_name_kana = "ﾔﾏﾀﾞ"
    expect(@parent_member).to be_invalid
  end

end
