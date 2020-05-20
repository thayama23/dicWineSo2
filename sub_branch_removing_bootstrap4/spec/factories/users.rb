FactoryBot.define do
  factory :user do
    name { 'sample' }
    email { 'sample@example.com' }
    password { 'sample@example.com' }
    admin { "false" }
    confirmed_at { Date.today}
    id { 1 }
  end

  factory :user2, class: User do
    name { 'sample2' }
    email { 'sample2@example.com' }
    password { 'sample2@example.com' }
    admin { "false" }
    confirmed_at { Date.today}
    id { 2 }
  end

  factory :admin, class: User do
    name { 'admin' }
    email { 'admin@example.com' }
    password { 'admin@example.com' }
    admin { "true" }
    confirmed_at { Date.today}
    id { 3 }
  end
end
