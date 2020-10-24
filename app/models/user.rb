class User < ApplicationRecord
    has_many :orders
    has_one :cart

    validates :username, uniqueness: true, presence: true
    has_secure_password
end
