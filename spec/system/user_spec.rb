require 'rails_helper'
RSpec.describe 'ユーザー新規登録・ログイン・ログアウト機能', type: :system do
  before do
    def user_login
      user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'user[email]', with: 'sample@example.com'
      fill_in 'user[password]', with: 'sample@example.com'
      click_button 'ログイン'
    end  
  end

  describe '新規登録のテスト' do
    context '新規登録のテスト' do
      it 'ユーザー新規登録のテスト' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'sample'
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: 'sample@example.com'
        fill_in 'user[password_confirmation]', with: 'sample@example.com'
        click_button 'アカウント登録'
        expect(page).to have_content '本人確認用のメールを送信しました。'
      end
    end
  end

  describe 'セッション機能のテスト' do
    context 'ユーザーが作成されている場合' do
      it 'ログインができること' do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: 'sample@example.com'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end

    context 'ログインされている場合' do
      it '自分の詳細画面(マイページ)に飛べること' do
        user_login
        sleep 2
        visit user_path(id: 1)
        expect(page).to have_content 'sampleのマイページ'
      end

      it '他人の詳細画面には入れない' do
        user2 = FactoryBot.create(:user2)
        user_login
        sleep 2
        visit user_path(id: 2)
        expect(page).to have_content '他の人のページへアクセスは出来ません!'
      end

      it 'ログアウトができること' do
        user_login
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
      end

      it 'アドミ権限でのログイン機能確認' do
        admin = FactoryBot.create(:admin)
        visit new_user_session_path
        fill_in 'user[email]', with: 'admin@example.com'
        fill_in 'user[password]', with: 'admin@example.com'
        click_button 'ログイン'
        expect(page).to have_content 'Wines_admin'
      end
    end 
  end  
end