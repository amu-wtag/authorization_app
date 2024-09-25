class User < ApplicationRecord
    has_secure_password

    # Creates methods (admin?, user?)
    enum role: {admin: 'admin', user: 'user', guest: 'guest'}

    validates :email, presence: true, uniqueness: true
end
