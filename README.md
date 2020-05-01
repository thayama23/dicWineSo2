# WineSo

## 概要
- ワインレビューアプリ

## コンセプト
- ワインとの出会い・評価を共有、ワイン好きが集まる場所にしたい。

## 背景
- ワイン好きの嗜好の共有手段として使って頂きたい。
- 愛好家はそれぞれのユニークな調達手段を持つが共有手段が限られている。その幅を広げ自分の嗜好を共有、新しい味に出会う機会を増やし、新発見、仲間との出会いからより交流が生まれる。またレビューを参考に試飲や今後の購入を検討、飲食も楽しくなると思いこのアプリケーション作りに挑戦しようと思った。

## バージョン情報
- Ruby 2.6.5
- Ruby on Rails 5.2.4.2
- PostgreSQL 12.1
- Bootstrap 4.1.1

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
  - [ ] 名前、メールアドレス、パスワードは必須
- [ ] マイページ
  - [ ] 登録内容変更
- [ ] ワイン一覧表示機能
  - [ ] アドミ権限で各タグ付け外し可能
  - [ ] ワイン詳細
    - [ ] ワインテーブルにある程度添い、詳細を閲覧
    - [ ] ワイン、お気に入り登録・解除
    - [ ] 他ユーザのコメント・５段階ランク付け可能
- [ ] 検索機能
  - [ ] キーワードであいまい検索
  - [ ] タグでも検索可能
- [ ] お気に入りページ
  - [ ] お気に入り指定ワインレビューの閲覧
  - [ ] お気に入り指定・解除

  
## カタログ設計
https://docs.google.com/spreadsheets/d/e/2PACX-1vQYY_fhi2NDMKUM94uBW9XdFZ3ij5v-bFGs5DlTrFCrPhuqlPpINVfpRcfGzwkgeSzWqPwXiBzvgiiK/pubhtml

## テーブル定義
https://docs.google.com/spreadsheets/d/e/2PACX-1vRN_KtNllzMLFAgWTP61iK2Eqfpycz2s6Z99CWi4JoTHU6Bf9XcCnMcbQymh0JE8k1u1c3uHQNGas32/pubhtml#

## ER図
https://docs.google.com/document/d/e/2PACX-1vRin04yDScZNAEqk8voIUm50IwMzvFbzLakO-9hEEtrPW3HRmGd-zQhmFBMjePshiiDIzz0PDx9b7dK/pub

## 画面遷移図
https://docs.google.com/document/d/e/2PACX-1vSwOQGvx7qjUCF4UFKW-a3l5EAukIpA2y8-wkCme4BMkDSV5DRoFnOircpgIG9Y5pxjzEwUzhRz6HO7/pub

## ワイヤーフレーム
https://docs.google.com/document/d/e/2PACX-1vT96j6JrP8uKNGbRXSMGzVrqzorvfvmXSCpesgmnPhr8lssT9ek6ED57t8NBc9BMeIu_XrCuKW8wUaH/pub

## 使用予定Gem
- devise
- rails-i18n
- devise-i18n
- carrierwave
- minimagick
- faker
- jquery-turbolinks
- ransack
- font-awesome-sass
- kaminari
- kaminari-bootstrap
- fog-aws
- bcrypt
- letter_opener
- letter_opener_web
- rspec-rails
- spring-commands-rspec
- factory_bot_rails
- launchy
- capybara
- webdrivers
