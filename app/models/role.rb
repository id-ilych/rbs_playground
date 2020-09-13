class Role < ApplicationRecord
  belongs_to :user
  validates :name, uniqueness: true, length: { minimum: 3 }
  validates :description, length: { minimum: 3 }
end
