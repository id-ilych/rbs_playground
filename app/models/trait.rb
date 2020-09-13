class Trait < ApplicationRecord
  has_many :gadget_traits
  has_many :gadgets, through: :gadget_traits
  validates :name, uniqueness: true, length: { minimum: 3 }
end
