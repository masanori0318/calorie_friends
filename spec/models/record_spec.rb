require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    
    @user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
    @record = Record.new(user: @user, breakfast: 'Eggs', lunch: 'Salad', dinner: 'Chicken', snack: 'Apple', breakfast_cal: 300, lunch_cal: 200, dinner_cal: 400, snack_cal: 100)
  end

  describe 'レコードの保存' do
    context 'レコードが投稿できる場合' do
      it '画像を投稿できる' do
        expect(@record).to be_valid
      end
      it '食事名を投稿できる' do
        expect(@record).to be_valid
      end
      it 'カロリー数値を投稿できる' do
        expect(@record).to be_valid
      end
      it 'カロリー数値のみで投稿できる' do
        @record.breakfast = ''
        @record.lunch = ''
        @record.dinner = ''
        @record.snack = ''
        expect(@record).to be_valid
      end
    end
    context 'レコードが投稿できない場合' do
      it 'ユーザーが紐付いていなければ投稿できない' do
        @record.user = nil
        @record.valid? # レコードをバリデーションする
        expect(@record.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
