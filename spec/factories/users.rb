FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { 'kkk111' }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '健吾' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'ケンゴ' }
    birthday              { '1995-09-15' }
  end
end
