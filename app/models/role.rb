class Role < ApplicationRecord
  belongs_to :user
  has_one :wallet, dependent: :destroy

  validates :name, uniqueness: true, length: { minimum: 3 }
  validates :description, length: { minimum: 3 }

  after_create :create_wallet
end
