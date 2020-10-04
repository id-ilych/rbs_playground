FactoryBot.define do
  factory :effect do
    transient do
      disabled_gadget_tags { [] }
      provided_traits { [] }
    end

    sequence(:name) { |n| "Effect #{n}" }

    after(:create) do |effect, evaluator|
      evaluator.disabled_gadget_tags.each do |tag|
        create(:effect_disabled_gadget_tag, effect: effect, gadget_tag: tag)
      end

      evaluator.provided_traits.each do |trait|
        create(:effect_provided_trait, effect: effect, trait: trait)
      end

      effect.reload
    end
  end

  factory :effect_provided_trait do
    association :effect
    association :trait
  end

  factory :effect_disabled_gadget_tag do
    association :effect
    association :gadget_tag
  end
end