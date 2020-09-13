class GadgetTrait < ApplicationRecord
  belongs_to :gadget
  belongs_to :trait
  validates :trait, uniqueness: { scope: :gadget, message: 'Gadget should not have duplicate traits' }
end
