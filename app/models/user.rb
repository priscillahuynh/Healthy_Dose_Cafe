class User < ApplicationRecord
    has_many :orders
    has_one :cart

    validates :username, uniqueness: true, presence: true
    has_secure_password

    def self.create_by_facebook(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u| 
        u.password = SecureRandom.hex
        end
    end
end
