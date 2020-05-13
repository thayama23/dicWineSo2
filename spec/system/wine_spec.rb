require 'rails_helper'
RSpec.describe 'ワインレビィー機能', type: :system do
  before do
    def user_login
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'user[email]', with: 'sample@example.com'
      fill_in 'user[password]', with: 'sample@example.com'
      click_button 'ログイン'
    end 

    def user_login2
      @user2 = FactoryBot.create(:user2)
      visit new_user_session_path
      fill_in 'user[email]', with: 'sample2@example.com'
      fill_in 'user[password]', with: 'sample2@example.com'
      click_button 'ログイン'
    end

    def label_create
      Label.create!(name: '個人輸入品')
      Label.create!(name: 'ワイナリー直送')
      Label.create!(name: 'イベント発掘品')
      Label.create!(name: '小売店品')
      Label.create!(name: '超お勧め！')
    end
  end

  describe 'ワインレビュー一覧画面' do
    context 'ワインレビューを作成した場合' do
      it '作成済みのワインレビューが表示される' do
        @user = FactoryBot.create(:user)
        wine = FactoryBot.create(:wine, user: @user)
        user_login2
        visit wines_path
        
        expect(page).to have_content '白テスト'
      end
    end

    context '複数のレビューを作成した場合' do
      it 'レビューが作成日時の降順に並んでいる事' do
        @user = FactoryBot.create(:user)
        wine = FactoryBot.create(:wine, user: @user)
        wine2 = FactoryBot.create(:wine2, user: @user)
        user_login2
        visit wines_path
        binding.irb
        wine_list = all('.wine_row') 

        expect(wine_list[0]).to have_content '赤テスト'
        expect(wine_list[1]).to have_content '白テスト'

        # wine = all('.wine_list')
        # wine_0 = wine[0]
        # expect(wine_0).to have_content '赤テスト'
      end
    end
  

  end


end