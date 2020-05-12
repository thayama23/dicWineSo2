require 'rails_helper'
RSpec.describe 'ユーザー新規登録・ログイン・ログアウト機能', type: :system do
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

  # describe 'セッション機能のテスト' do
  #   before do
  #     user = FactoryBot.create(:user)
  #     admin_user = FactoryBot.create(:admin_user)
  #   end
  #   context 'ユーザーが作成されている場合' do
  #     it 'ログインができること' do
  #       visit new_session_path
  #       fill_in 'session[email]', with: 'sample@example.com'
  #       fill_in 'session[password]', with: '00000000'
  #       click_button 'Log in'
  #       expect(current_path).to eq user_path(id: 2)
  #     end
  #   end

  #   context 'ログインされている場合' do
  #     before do
  #       visit new_session_path
  #       fill_in 'session[email]', with: 'sample@example.com'
  #       fill_in 'session[password]', with: '00000000'
  #       click_button 'Log in'

  #     end

  #     it '自分の詳細画面(マイページ)に飛べること' do
  #       visit user_path(id: 4)
  #       expect(current_path).to eq user_path(id: 4)
  #     end

  #     it '一般ユーザーが他人の詳細画面に飛ぶとタスク一覧ページに遷移すること' do
  #       visit user_path(id: 7)

  #       expect(page).to have_content '他の人のページへアクセスは出来ません!'
  #     end

  #     it 'ログアウトができること' do
  #       visit user_path(id: 8)
  #       click_link 'Logout'
  #       save_and_open_page
  #       expect(page).to have_content 'ログアウトしました'
  #     end
  #   end
  end