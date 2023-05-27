require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :request do
  describe 'GET /public_recipes' do
    it 'returns http success' do
      get '/public_recipes'
      expect(response).to have_http_status(200)
    end
  end
end
