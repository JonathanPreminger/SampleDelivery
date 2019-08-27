require 'rails_helper'

RSpec.describe DjSetValidatesController, type: :controller do

  describe "GET #valid" do
    it "returns http success" do
      get :valid
      expect(response).to have_http_status(:success)
    end
  end

end
