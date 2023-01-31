class Chama < ApplicationRecord

    validates :name, :username, :email, :reg_no, uniqueness:true, presence:true


end
