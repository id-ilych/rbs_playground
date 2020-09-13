class GadgetGadgetTag < ApplicationRecord
  belongs_to :gadget
  belongs_to :gadget_tag
  validates :gadget_tag, uniqueness: { scope: :gadget, message: 'Gadget should not have duplicate tags' }
end
