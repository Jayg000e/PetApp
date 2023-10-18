class User < ApplicationRecord
  has_many :pets, dependent: :destroy

  # Add any necessary validations or methods here.
  # For example:
  # validates :username, presence: true, uniqueness: true
end
