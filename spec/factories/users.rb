FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "login#{n}" }
    sequence(:password) { |n| "#{n}nigol" }
  end
end