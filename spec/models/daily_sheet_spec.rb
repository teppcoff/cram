require 'rails_helper'

RSpec.describe DailySheet, type: :model do

  before do
    @daily_sheet = FactoryBot.build(:daily_sheet)
  end

  it "factorybotが成功すること" do
    expect(@daily_sheet).to be_valid
  end

  it "messageが必要であること" do
    @daily_sheet.message = " "
    expect(@daily_sheet).to be_invalid
  end

  it "messageは200字以下であること" do
    @daily_sheet.message = "あ" * 201
    expect(@daily_sheet).to be_invalid
  end

  it "informationは200字以下であること" do
    @daily_sheet.information = "い" * 201
    expect(@daily_sheet).to be_invalid
  end

  it "study_dateが必要であること" do
    @daily_sheet.study_date = nil
    expect(@daily_sheet).to be_invalid
  end

  it "participationが必要であること" do
    @daily_sheet.participation = nil
    expect(@daily_sheet).to be_invalid
  end

  it "staff_memberが必要であること" do
    @daily_sheet.staff_member = nil
    expect(@daily_sheet).to be_invalid
  end

  it "student_memberが必要であること" do
    @daily_sheet.student_member = nil
    expect(@daily_sheet).to be_invalid
  end

  it "subjectが必要であること" do
    @daily_sheet.subject = nil
    expect(@daily_sheet).to be_invalid
  end

  it "periodが必要であること" do
    @daily_sheet.period = nil
    expect(@daily_sheet).to be_invalid
  end
  
end
