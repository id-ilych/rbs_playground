class User < ApplicationRecord
  validates :login, uniqueness: true, length: { minimum: 3 }
  validates :password, length: { minimum: 6 }

  has_one :role
end
