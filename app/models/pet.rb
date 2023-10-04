class Pet < ApplicationRecord
    belongs_to :user  # Add this line to establish the association
end
