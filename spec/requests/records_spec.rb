require 'rails_helper'

RSpec.describe RecordsController, type: :request do
  include Devise::Test::IntegrationHelpers # Deviseのテストヘルパーをインクルード

  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "indexアクションに正常なレスポンスを返すこと" do
      get records_path
      expect(response.status).to eq 200
    end
    
    it "indexアクションにリクエストするとレスポンスに投稿済みのレコード情報が存在する" do
      record = FactoryBot.create(:record, user: user, breakfast: "Some value", lunch: "Some lunch value", dinner: "Some dinner value", snack: "Some snack value", breakfast_cal: 100, lunch_cal: 400, dinner_cal: 500, snack_cal: 200)
      puts "Generated record breakfast: #{record.breakfast}"
      get records_path
      expect(response.body).to include(record.breakfast)
    end
  end
end