require 'rails_helper'

RSpec.describe Wine, type: :model do
  describe "validation" do
    it '画像(image)が空白ならバリデーションは通らない。' do
      @user = FactoryBot.create(:user)
      @wine = Wine.new(
       image: nil,
       price: 7001,
       kind: "白",
       country: "日本",
       origin: "山梨",
       name: "山梨の白ワイン",
       vintage: "1980-01-01",
       ranking: 5,
       user: @user
      )
      expect(@wine).to be_invalid
    end    
  end
end

