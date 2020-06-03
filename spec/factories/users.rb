FactoryBot.define do
  factory :user do
    sequence(:email) { "tesuto1@xxx.jp"}
    sequence(:password) {"111111"}
  end
end
