FactoryBot.define do
  factory :role do
    transient do
      credits { nil }
      effects { [] }
    end

    sequence(:name) { |n| "User #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    association :user

    after(:create) do |role, evaluator|
      evaluator.effects.each do |effect|
        role.add_effect(effect)
      end

      role.wallet.update!(credits: evaluator.credits) unless evaluator.credits.nil?

      role.reload
    end
  end

  factory :wallet do
    credits { 100 }
  end

  factory :role_effect do
    association :role
    association :effect
    counter { 0 }
  end
end