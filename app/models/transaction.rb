class Transaction < ApplicationRecord
    belongs_to :user
    belongs_to :asset

    # validates :vendor_name, :amount_spent, presence: true
end
