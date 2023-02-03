class Chama < ApplicationRecord

    validates :name, :username, :reg_no, presence: true
    validates :username, :reg_no, uniqueness: true
    enum :status, { unverified: 0, verified: 1 }

    belongs_to :admin, class_name: 'User', inverse_of: :created_chamas, foreign_key: :user_id
end
