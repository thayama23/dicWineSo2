FactoryBot.define do
  factory :user do
    name { 'sample' }
    email { 'sample@example.com' }
    password { 'sample@example.com' }
    admin { "false" }
  end
end
