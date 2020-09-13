class GadgetTag < ApplicationRecord
  has_many :gadget_gadget_tags
  has_many :gadgets, through: :gadget_gadget_tags
  validates :name, uniqueness: true, length: { minimum: 3 }
end
