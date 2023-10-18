class Pet < ApplicationRecord
    belongs_to :user
    has_many :activities, dependent: :destroy

    # Add any necessary validations or methods here.
  end
