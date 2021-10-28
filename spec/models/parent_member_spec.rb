require 'rails_helper'

describe ParentMember do
  describe "#create" do

    it "emailが必要であること" do
      parent_member = build(:parent_member, email: nil)
      expect(parent_member.valid?).to be_falsey
    end

    it "family_name_kanaは全角のカタカナであること" do
      parent_member = build(:parent_member, family_name_kana: "山田")
      expect(parent_member.valid?).to be_falsey
    end
  end
end
