class EffectDisabledGadgetTag < ApplicationRecord
  belongs_to :effect
  belongs_to :gadget_tag
  validates :gadget_tag, uniqueness: { scope: :effect, message: 'Effect should not have duplicate disabled gadget tags' }
end
