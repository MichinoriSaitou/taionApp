FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_user#{n}" }
    sequence(:email) { |n| "test_email#{n}@example.com" }
    sequence(:password) { "password" }

    trait :user_with_groups do
      after(:build) do |user|  
        user.groups << build(:group)
      end
    end
  end
end
