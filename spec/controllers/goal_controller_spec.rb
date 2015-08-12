require 'rails_helper'

RSpec.describe GoalController, type: :controller do

  describe "GET #goal_type:integer" do
    it "returns http success" do
      get :goal_type:integer
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #amount:decimal" do
    it "returns http success" do
      get :amount:decimal
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #frequency_id:integer" do
    it "returns http success" do
      get :frequency_id:integer
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #start_date:datetime" do
    it "returns http success" do
      get :start_date:datetime
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #end_date:datetime" do
    it "returns http success" do
      get :end_date:datetime
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user_id:integer" do
    it "returns http success" do
      get :user_id:integer
      expect(response).to have_http_status(:success)
    end
  end

end
