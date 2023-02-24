class Asset < ApplicationRecord
    has_many :transactions, dependent: :destroy
    has_many :users, through: :transactions
    belongs_to :creator, class_name: "User", foreign_key: :user_id 
    # validates :investment_name, presence:true
end
