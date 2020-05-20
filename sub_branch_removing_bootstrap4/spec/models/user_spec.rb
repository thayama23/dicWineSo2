require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録のバリデーション" do
    it 'name入力がなければ、バリデーションは通らない。' do
      @user = User.new(
       name: nil,
       email: "test@example.com",
       password: "test@example.com",
       password_confirmation: "test@example.com"
      )
      expect(@user).to be_invalid
    end    
  end
end
