class Role < ApplicationRecord
  belongs_to :user
  has_one :wallet, dependent: :destroy
  has_many :role_gadgets, dependent: :destroy
  has_many :gadgets, through: :role_gadgets
  has_many :role_effects, dependent: :destroy
  has_many :active_effects, -> { RoleEffect.active }, through: :role_effects, source: :effect

  validates :name, uniqueness: true, length: { minimum: 3 }
  validates :description, length: { minimum: 3 }

  after_create :create_wallet

  def add_effect(effect)
    RoleEffect.increment(self, effect)
  end

  def remove_effect(effect)
    RoleEffect.decrement(self, effect)
  end
end
