class Effect < ApplicationRecord
  has_many :effect_disabled_gadget_tags, dependent: :destroy
  has_many :disabled_gadget_tags, through: :effect_disabled_gadget_tags, source: :gadget_tag
  has_many :disabled_gadgets, through: :disabled_gadget_tags, source: :gadgets
  has_many :effect_provided_traits, dependent: :destroy
  has_many :provided_traits, through: :effect_provided_traits, source: :trait
  validates :name, uniqueness: true, length: { minimum: 3 }
end
