FactoryBot.define do
  factory :wine do
    image { File.open('./app/assets/images/sample_image.jpeg') }
    price { 5001 }
    kind { '白テスト'}
    country { '原産国テスト'}
    origin { '生産地テスト'}
    name { 'ワイン名テスト' }
    vintage { '1950-01-01' }
    ranking { '残念' }
    overview { 'テストoveriew'}
  end

  factory :wine2, class: Wine do
    image { File.open('./app/assets/images/sample_image.jpeg') }
    price { 6001 }
    kind { '赤テスト'}
    country { '原産国テスト2'}
    origin { '生産地テスト2'}
    name { 'ワイン名テスト2' }
    vintage { '1960-01-01' }
    ranking { '最高！' }
    overview { 'テストoveriew2'}
  end
  
end
