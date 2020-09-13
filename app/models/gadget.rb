class Gadget < ApplicationRecord
  has_many :gadget_gadget_tags, dependent: :destroy
  has_many :gadget_tags, through: :gadget_gadget_tags
  has_many :gadget_traits, dependent: :destroy
  has_many :traits, through: :gadget_traits
  validates :name, uniqueness: true, length: { minimum: 3 }
end
