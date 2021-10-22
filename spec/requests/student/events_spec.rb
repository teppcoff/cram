require 'rails_helper'

RSpec.describe "Student::Events", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/student/events/index"
      expect(response).to have_http_status(:success)
    end
  end

end
