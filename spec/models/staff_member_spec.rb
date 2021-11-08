require 'rails_helper'

describe StaffMember do
  describe "#create" do

    it "factorybotが成功すること" do
      staff_member = build(:staff_member)
      expect(staff_member).to be_valid
    end

    it "emailが必要であること" do
      staff_member = build(:staff_member, email: nil)
      expect(staff_member.valid?).to be_falsey
    end

    it "family_name_kanaは全角カタカナであること" do
      staff_member = build(:staff_member, family_name_kana: "ﾔﾏﾀﾞ")
      expect(staff_member.valid?).to be_falsey
    end
    
  end
end
