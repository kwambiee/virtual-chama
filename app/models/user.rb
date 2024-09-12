class User < ApplicationRecord
    # require "securerandom"

    before_create :confirmation_token
    has_secure_password

    # for user/admin that has created chamas, to identify all chamas they have created
    has_many :created_chamas, inverse_of: :admin, class_name: 'Chama'
    # for members who have joined chamas, to identify all chamas they have joined
    has_many :chama_memberships
    has_many :chamas, through: :chama_memberships

    enum :status, { unverified: 0, verified: 1 }
    EMAIL_REGEX =^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$ 
    
    validates :first_name, :last_name, :phone, :email, presence: true
    validates :phone, :email, uniqueness: true
    validates_format_of :email, with: EMAIL_REGEX

    def valid_email? email
      email =~EMAIL_REGEX
    end

    private

    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end

end
