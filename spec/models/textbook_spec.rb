require 'rails_helper'

RSpec.describe Textbook, type: :model do

  before do
    @textbook = FactoryBot.build(:textbook)
  end

  it "factorybotが成功すること" do
    expect(@textbook).to be_valid
  end

  it "text_typeが必要であること" do
    @textbook.text_type = nil
    expect(@textbook).to be_invalid
  end

end
