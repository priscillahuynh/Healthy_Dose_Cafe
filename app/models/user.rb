class User < ApplicationRecord
    has_many :orders
    has_one :cart

    validates :username, uniqueness: true, presence: true
    validates :password, length: {minimum: 8}
    has_secure_password

    def self.create_by_facebook(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u| 
        u.password = SecureRandom.hex
        end
    end

    def self.highest_paying_customers
        users = self.joins(:orders).group(:username).sum(:total)
        users.sort_by {|k,v| v}.reverse.to_h.first(3)
    end
end
