class User < ApplicationRecord
    # require "securerandom"

    before_create :confirmation_token
    has_secure_password

    has_many :created_chamas, inverse_of: :admin, class_name: 'Chama'
    has_many :chamas, through: :chama_memberships

    enum :status, { unverified: 0, verified: 1 }
    validates :first_name, :last_name, :phone, :email, presence: true
    validates :phone, :email, uniqueness: true

    private

    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
