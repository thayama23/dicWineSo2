require 'rails_helper'
RSpec.describe 'ワインレビィー機能', type: :system do
  before do
    # def user_login
    #   @user = FactoryBot.create(:user)
    #   visit new_user_session_path
    #   fill_in 'user[email]', with: 'sample@example.com'
    #   fill_in 'user[password]', with: 'sample@example.com'
    #   click_button 'ログイン'
    # end 

    def create_user_wine
      @user = FactoryBot.create(:user)
      wine = FactoryBot.create(:wine, user: @user)
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
        create_user_wine
        user_login2
        visit wines_path
        
        expect(page).to have_content '白テスト'
      end
    end

    context '複数のレビューを作成した場合' do
      it 'レビューが作成日時の降順に並んでいる事' do
        create_user_wine
        wine2 = FactoryBot.create(:wine2, user: @user)
        user_login2
        visit wines_path
        wine_list = all('.wine_row') 

        expect(wine_list[0]).to have_content '赤テスト'
        expect(wine_list[1]).to have_content '白テスト'
      end
    end
  
    context 'レビュー詳細ページから' do
      it 'お気に入り指定が出来る' do
        create_user_wine
        user_login2
        visit wines_path
        sleep 2
        
        click_on '詳細確認'
        click_on 'お気に入り指定する'
        expect(page).to have_content 'sampleさんのブログをお気に入り登録しました'
      end
    end

    context 'ラベル（タグ）付及び編集機能' do
      it 'ラベル（タグ）付機能及び編集の確認' do
        label_create
        create_user_wine
        visit wines_path
        click_on 'ログイン'
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: 'sample@example.com'
        click_button 'ログイン'
        # binding.irb
        sleep 1
        click_on '編集'
        sleep 1
        page.accept_alert
      
        check '個人輸入品'
        check 'ワイナリー直送'
        check 'イベント発掘品'
        check'小売店品'
        check '超お勧め！'
    
        click_button '更新する'
        expect(page).to have_content "個人輸入品 ワイナリー直送 イベント発掘品 小売店品 超お勧め！"
      end
    end
  end

  describe '検索機能の確認' do
    context 'ワイン種類指定で検索' do
      it '指定種類が表示される' do
        create_user_wine
        wine2 = FactoryBot.create(:wine2, user: @user)
        user_login2
        visit wines_path

        fill_in 'q[kind_cont]', with: '白'
        click_button '検索'
        #白で検索したから、'赤'は出ない
        expect(page).to have_no_content '赤'
      end
    end

    context 'ワイン種類指定で検索' do
      it '"評価"での検索確認' do
        create_user_wine
        wine2 = FactoryBot.create(:wine2, user: @user)
        user_login2
        visit wines_path
        # select('最高！' from: 'q[ranking_eq]')、では効かない。
        find("option[value='5']").select_option
      
        click_button '検索'
        #'最高！'評価は赤テストだけ、よってそれを拾えれば確認が取れる。
        expect(page).to have_content '赤テスト'
      end
    end

  end
end
