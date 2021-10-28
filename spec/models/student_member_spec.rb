require 'rails_helper'

describe StudentMember do
  describe "#create" do
    it "given_name_kanaは全角カタカナであること" do
      student_member = build(:student_member, given_name_kana: "太郎")
      expect(student_member.valid?).to be_falsey
    end
  end
end
