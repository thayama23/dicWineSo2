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

Label.create!(name: '個人輸入品')
Label.create!(name: 'ワイナリー直送')
Label.create!(name: 'イベント発掘品')
Label.create!(name: '小売店品')
Label.create!(name: '超お勧め！')

User.create(
  name: "admin_user",
  email: "admin_user@example.com",
  password: "admin_user@example.com",
  password_confirmation: "admin_user@example.com",
  admin: "true"
)


10.times do |n|
  User.create!(
    name: "yoyogi#{n + 1}",
    email: "yoyogi#{n + 1}@example.com",
    password: "yoyogi#{n + 1}@example.com",
    password_confirmation: "yoyogi#{n + 1}@example.com"
  )
end

5.times do |n|
  country = Faker::Address.country
  origin = Faker::Address.city
  name = Faker::Games::Pokemon.name

  # user = User.create(name: "yoyogi1", email: "yoyogi1@example.com", password: "yoyogi1@example.com", )
  user = User.find(3)
  user.wines.create!(
    user_id: 4,
    image: File.open('./app/assets/images/sample_image.jpeg'),
    price: (n+1)*1000,
    kind: "白#{n + 1}",
    variety: "ソーヴィニヨン#{n + 1}",
    country: country,
    origin: origin,
    name: name,
    vintage: n+5+1980
    # ranking: "#{n+1}"
  )
end

5.times do |n|
  country = Faker::Address.country
  origin = Faker::Address.city
  name = Faker::Games::Pokemon.name

  user = User.find(5)
  user.wines.create!(
    user_id: 5,
    image: File.open('./app/assets/images/sample_image.jpeg'),
    price: (n+1)*5000,
    kind: "赤#{n + 1}",
    variety: "メルロー#{n + 1}",
    country: country,
    origin: origin,
    name: name,
    vintage: n*2+1950
    # ranking: "#{n+1}"
  )
end


