class ChamaMembership < ApplicationRecord
    belongs_to :user
    belongs_to :chama

    enum :status, { pending:0, approved:1, rejected:2 }
    validates :user_id, :chama_id, presence: true


end
