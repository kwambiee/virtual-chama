class User < ApplicationRecord
    require "securerandom"

    has_secure_password
    has_many :created_chamas, inverse_of: :admin, class_name: 'Chama'
    enum :status, { unverified: 0, verified: 1 }
    validates :first_name, :last_name, :phone, :email, presence: true
    validates :phone, :email, uniqueness: true
end
