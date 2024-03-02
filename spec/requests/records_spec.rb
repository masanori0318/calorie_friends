require 'rails_helper'

RSpec.describe RecordsController, type: :request do
  include Devise::Test::IntegrationHelpers # Deviseのテストヘルパーをインクルード

  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "正常なレスポンスを返すこと" do
      get records_path
      expect(response.status).to eq 200
    end

    
  end
end