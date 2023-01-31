class Chama < ApplicationRecord
    require "securerandom"

    has_secure_password validations: false

    validates :name, :username, :email, :reg_no, uniqueness:true, presence:true


end
