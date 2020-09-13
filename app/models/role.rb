class Role < ApplicationRecord
  belongs_to :user
  has_one :wallet, dependent: :destroy
  has_many :role_gadgets, dependent: :destroy
  has_many :gadgets, through: :role_gadgets

  validates :name, uniqueness: true, length: { minimum: 3 }
  validates :description, length: { minimum: 3 }

  after_create :create_wallet
end
