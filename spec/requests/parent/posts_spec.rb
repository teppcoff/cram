require 'rails_helper'

RSpec.describe "Parent::Posts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/parent/posts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/parent/posts/show"
      expect(response).to have_http_status(:success)
    end
  end

end
