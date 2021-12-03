require 'rails_helper'

RSpec.describe Post, type: :model do
  
  before do
    @post = FactoryBot.build(:post)
  end

  it "factorybotが成功すること" do
    expect(@post).to be_valid
  end

  it "contentが必要であること" do
    @post.content = " "
    expect(@post).to be_invalid
  end

end
