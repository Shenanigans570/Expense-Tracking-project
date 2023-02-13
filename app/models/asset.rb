class Asset < ApplicationRecord
    has_many :transactions, dependent: :destroy
    has_many :users, through: :transactions

    validates :investment_name, uniqueness: true
end
