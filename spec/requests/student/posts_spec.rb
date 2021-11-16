require 'rails_helper'

RSpec.describe "Student::Posts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/student/posts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/student/posts/show"
      expect(response).to have_http_status(:success)
    end
  end

end
