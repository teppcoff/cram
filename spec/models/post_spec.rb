require 'rails_helper'

RSpec.describe Post, type: :model do
  
  before do
    @post = FactoryBot.build(:post)
  end

  it "factorybotが成功すること" do
    expect(@post).to be_valid
  end

  it "titleが必要であること" do
    @post.title = " "
    expect(@post).to be_invalid
  end

  it "titleは20字以下であること" do
    @post.title = "あ" * 21
    expect(@post).to be_invalid
  end

  it "contentが必要であること" do
    @post.content = " "
    expect(@post).to be_invalid
  end

  it "titleは400字以下であること" do
    @post.title = "あ" * 401
    expect(@post).to be_invalid
  end

end
