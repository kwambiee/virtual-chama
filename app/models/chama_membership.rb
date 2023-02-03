class ChamaMembership < ApplicationRecord
    belongs_to :user
    belongs_to :chama
end
