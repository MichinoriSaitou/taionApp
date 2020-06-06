FactoryBot.define do
  factory :user do
    sequence(:name) { "テスト"}
    sequence(:email) { "tesuto@xx.jp"}
    sequence(:password) {"111111"}
  end
end
