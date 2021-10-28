require 'rails_helper'

describe ParentMember do
  describe "#create" do
    it "emailが必要であること" do
      parent_member = build(:parent_member, email: nil)
      expect(parent_member.valid?).to be_falsey
    end
  end
end
