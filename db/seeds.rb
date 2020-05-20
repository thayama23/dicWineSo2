# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5.times do |n|
#   name = Faker::Games::Pokemon.name
#   email = Faker::Internet.email
#   password = "password"
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password,
#                photo: File.open('./app/assets/images/default_user.jpg')
#                )
# end

# Label.create!(name: '個人輸入品')
# Label.create!(name: 'ワイナリー直送')
# Label.create!(name: 'イベント発掘品')
# Label.create!(name: '小売店品')
# Label.create!(name: '超お勧め！')

# 5.times do |n|
#   User.create!(
#     name: "yoyogi#{n + 1}",
#     email: "yoyogi#{n + 1}@example.com",
#     password: "yoyogi#{n + 1}@example.com",
#     password_confirmation: "yoyogi#{n + 1}@example.com"
#   )
# end

# User.create(
#   name: "admin",
#   email: "admin@example.com",
#   password: "admin@example.com",
#   password_confirmation: "admin@example.com",
#   admin: "true"
# )

# 5.times do |n|
#   country = Faker::Address.country
#   origin = Faker::Address.city
#   name = Faker::Games::Pokemon.name

#   # user = User.create(name: "  yoyogi1", email: "  yoyogi1@example.com", password: "  yoyogi1@example.com", )
#   user = User.find(3)
#   user.wines.create!(
#     user_id: 3,
#     image: File.open('./app/assets/images/sample_image.jpeg'),
#     price: (n+1)*1000,
#     kind: "白#{n + 1}",
#     variety: "シャルドネ#{n + 1}",
#     country: "USA",
#     origin: "ナパ",
#     name: "ナパのシャルドネ#{n + 1}",
#     vintage: "1980-01-01",
#     ranking: "美味しい！"
#   )
# end

# 5.times do |n|
#   country = Faker::Address.country
#   origin = Faker::Address.city
#   name = Faker::Games::Pokemon.name

#   user = User.find(4)
#   user.wines.create!(
#     user_id: 4,
#     image: File.open('./app/assets/images/sample_image.jpeg'),
#     price: (n+1)*5000,
#     kind: "赤#{n + 1}",
#     variety: "メルロー#{n + 1}",
#     country: "オーストラリア",
#     origin: "メルボルン",
#     name: "OZメル#{n + 1}",
#     vintage: "1950-01-01",
#     ranking: "最高！"
#   )
# end

5.times do |n|
  country = Faker::Address.country
  origin = Faker::Address.city
  name = Faker::Games::Pokemon.name

  user = User.find(5)
  user.wines.create!(
    user_id: 5,
    image: File.open('./app/assets/images/sample_image.jpeg'),
    price: (n+1)*10000,
    kind: "ロゼ#{n + 1}",
    variety: "ミックス#{n + 1}",
    country: "日本",
    origin: "山梨",
    name: "山梨のロゼ#{n + 1}",
    vintage: "2000-01-01",
    ranking: "まーまー"
  )
end


