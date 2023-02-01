class Chama < ApplicationRecord
    require "securerandom"

    has_secure_password validations: false
    validates :name, :username, :email, :reg_no, uniqueness:true, presence:true
    enum :status, { unverified: 0, verified: 1 }
end
