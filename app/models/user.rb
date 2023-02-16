class User < ApplicationRecord
    has_many :transactions, dependent: :destroy
    has_many :assets, through: :transactions
    has_secure_password

   
end
