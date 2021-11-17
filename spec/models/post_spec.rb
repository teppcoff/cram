require 'rails_helper'

describe Post do
  describe "#create" do

    it "factorybotが成功すること" do
      post = build(:post)
      expect(post).to be_valid
    end

    it "contentが必要であること" do
      post = build(:post, content: nil)
      expect(post.valid?).to be_falsey
    end

  end
end
