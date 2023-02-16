class User < ApplicationRecord
    has_many :transactions, dependent: :destroy
    has_many :assets, through: :transactions
    has_many :created_assets, class_name: "Asset"
    has_secure_password

   
end
