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
        wine_list = all('.wine_row') 

        expect(wine_list[0]).to have_content '赤テスト'
        expect(wine_list[1]).to have_content '白テスト'
      end
    end
  
    context 'レビュー詳細ページから' do
      it 'お気に入り指定が出来る' do
        @user = FactoryBot.create(:user)
        wine = FactoryBot.create(:wine, user: @user)
        user_login2
        visit wines_path
        sleep 2
        
        click_on '詳細確認'
        click_on 'お気に入り指定する'
        expect(page).to have_content 'sampleさんのブログをお気に入り登録しました'
      end
    end

    # context 'レビューへラベル（タグ）付機能' do
    #   it 'ラベル（タグ）付機能の確認' do
    #     label_create
    #     user_login
    #     click_on 'ワインレビューを投稿しよう！'
        
    #     attach_file "画像", "./app/assets/images/sample_image.jpeg"
    #     fill_in "価格", with: 7001
    #     fill_in "種類", with: "スパークリング"
    #     fill_in "生産国", with: "USA"
    #     fill_in "原産地", with: "アリゾナ"
    #     fill_in "名前", with: "アリゾナのスパークリング"
    #     binding.irb
    #     fill_in "収穫年", with: "1970-01-01"
    #     # select ("1970-01-01" from "収穫年")
    #     fill_in "評価", with: "最高！"

    #     find(:css, "#wine_label_ids_1[value='1']").set(true)
    #     find(:css, "#wine_label_ids_1[value='2']").set(true)
    #     find(:css, "#wine_label_ids_1[value='3']").set(true)
    #     find(:css, "#wine_label_ids_1[value='4']").set(true)
    #     find(:css, "#wine_label_ids_1[value='5']").set(true)
    #     click_on '登録する'
        
    #     expect(page).to have_content "個人輸入品 ワイナリー直送 イベント発掘品 小売店品 超お勧め！"

    #   end
    # end

    context 'レビューへラベル（タグ）付機能' do
      it 'ラベル（タグ）付機能の確認' do
        label_create
        @user = FactoryBot.create(:user)
        wine = FactoryBot.create(:wine, user: @user)
        visit wines_path
        click_on 'ログイン'
        fill_in 'user[email]', with: 'sample@example.com'
        fill_in 'user[password]', with: 'sample@example.com'
        click_button 'ログイン'

        click_on 'レビュー編集'
        sleep 1
        page.accept_alert

        # binding.irb
      
        check '個人輸入品'
        check 'ワイナリー直送'
        check 'イベント発掘品'
        check'小売店品'
        check '超お勧め！'
    
        # find(:css, "#wine_label_ids_1[value='1']").set(true)
        # find(:css, "#wine_label_ids_2[value='2']").set(true)
        # find(:css, "#wine_label_ids_3[value='3']").set(true)
        # find(:css, "#wine_label_ids_4[value='4']").set(true)
        # find(:css, "#wine_label_ids_5[value='5']").set(true)
        click_button '更新する'
        
        expect(page).to have_content "個人輸入品 ワイナリー直送 イベント発掘品 小売店品 超お勧め！"
      end
    end
  end

  describe '検索機能の確認' do
    # before do
    #   @user = FactoryBot.create(:user)
    #   wine = FactoryBot.create(:wine, user: @user)
    #   wine2 = FactoryBot.create(:wine2, user: @user)
    #   user_login2
    #   visit wines_path
    #   wine_list = all('.wine_row') 

    #   expect(wine_list[0]).to have_content '赤テスト'
    #   expect(wine_list[1]).to have_content '白テスト'
    # end

    context 'ワイン種類指定で検索' do
      it '指定種類が表示される' do
        @user = FactoryBot.create(:user)
        wine = FactoryBot.create(:wine, user: @user)
        wine2 = FactoryBot.create(:wine2, user: @user)
        user_login2
        visit wines_path
        # wine_list = all('.wine_row')

        fill_in 'q[kind_cont]', with: '白'
        click_button '検索'
        # expect(wine_list[0]).to have_content '白テスト'
        #白で検索したから、'赤'は出ない
        expect(page).to have_no_content '赤'
      end
    end

    context 'ワイン種類指定で検索' do
      it '"評価"での検索確認' do
        @user = FactoryBot.create(:user)
        wine = FactoryBot.create(:wine, user: @user)
        wine2 = FactoryBot.create(:wine2, user: @user)
        user_login2
        visit wines_path
        # wine_list = all('.wine_row')
  
        select('最高！' from:'q[ranking_eq]')
        binding.irb
        click_button '検索'
        
        expect(page).to have_no_content '残念'
      end
    end

  end
end
