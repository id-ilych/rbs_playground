class EffectProvidedTrait < ApplicationRecord
  belongs_to :effect
  belongs_to :trait
  validates :trait, uniqueness: { scope: :effect, message: 'Effect should not have duplicate traits' }
end
