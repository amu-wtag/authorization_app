class User < ApplicationRecord
    before_create :generate_confirmation_token
    has_secure_password

    # Creates methods (admin?, user?)
    enum role: {admin: 'admin', user: 'user', guest: 'guest'}

    validates :email, presence: true, uniqueness: true

    def generate_confirmation_token
        self.confirmation_token = SecureRandom.hex(10)
    end
end
