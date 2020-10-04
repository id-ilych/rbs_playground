FactoryBot.define do
  factory :gadget do
    transient do
      tags { [] }
      traits { [] }
    end

    sequence(:name) { |n| "Gadget #{n}" }

    after(:create) do |gadget, evaluator|
      evaluator.traits.each do |trait|
        create(:gadget_trait, gadget: gadget, trait: trait)
      end

      evaluator.tags.each do |tag|
        create(:gadget_gadget_tag, gadget: gadget, gadget_tag: tag)
      end

      gadget.reload
    end
  end

  factory :gadget_tag do
    sequence(:name) { |n| "tag#{n}" }
  end

  factory :gadget_gadget_tag do
    association :gadget
    association :gadget_tag
  end

  factory :gadget_trait do
    association :gadget
    association :trait
  end
end