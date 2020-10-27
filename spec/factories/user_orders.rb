FactoryBot.define do
  factory :user_order do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '111-1111' }
    prefecture_id { 2 }
    city { '東京都' }
    block { '渋谷区1-1' }
    building { '東京ビルディング' }
    phone { 11_111_111_111 }
    order_id { 1 }
  end
end
