require 'rails_helper'

describe StudentMember do
  describe "#create" do

    it "factorybotが成功すること" do
      student_member = build(:student_member)
      expect(student_member).to be_valid
    end

    it "given_name_kanaは全角カタカナであること" do
      student_member = build(:student_member, given_name_kana: "太郎")
      expect(student_member.valid?).to be_falsey
    end
    
  end
end
