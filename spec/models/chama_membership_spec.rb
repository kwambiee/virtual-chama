require 'rails_helper'

RSpec.describe  ChamaMembership, type: :model do

    describe 'Validations' do
        let (:user_one) {build(:user)}
        let (:chama_one) { Chama.create(name: "Tuliza Foundation", reg_no: "1234", username: "Tuliza", admin: user_one) }
        let (:chama_membership_one) { ChamaMembership.create(user: user_one, chama: chama_one) }

        [:user_id, :chama_id].each do |field|
            it "should validate presence of #{field}" do
                expect(chama_membership_one).to be_valid
            end
        end
    end

    describe 'Associations' do
        it { should belong_to(:user) }
        it { should belong_to(:chama) }
    end
end
