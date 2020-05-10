# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Label.create!(name: '個人輸入品')
# Label.create!(name: 'ワイナリー直送')
# Label.create!(name: 'イベント発掘品')
# Label.create!(name: '小売店品')
# Label.create!(name: '超お勧め！')

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

10.times do |n|
  User.create!(
    name: "yoyogi#{n + 1}",
    email: "yoyogi#{n + 1}@example.com",
    password: "yoyogi#{n + 1}@example.com",
    password_confirmation: "yoyogi#{n + 1}@example.com"
  )
end


# create_table "wines", force: :cascade do |t|
#   t.text "image"
#   t.integer "price"
#   t.string "kind"
#   t.string "variety"
#   t.string "country"
#   t.string "origin"
#   t.string "name"
#   t.integer "vintage"
#   t.integer "taste"
#   t.integer "ranking"
#   t.text "overview"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.bigint "user_id"
#   t.index ["user_id"], name: "index_wines_on_user_id"
# end
