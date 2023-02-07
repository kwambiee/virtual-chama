require 'rails_helper'

RSpec.describe Chama, type: :model do

    describe 'Validations' do
        let (:user_one) {build(:user)}
        let (:chama_one) { Chama.create(name: "Tuliza Foundation", reg_no: "1234", username: "Tuliza", admin: user_one) }

        [:name, :reg_no, :username, :user_id].each do |field|
            it "should validate presence of #{field}" do
                expect(chama_one).to be_valid
            end
        end
        [:reg_no, :username].each do |field|
            it "should validate uniqueness of #{field}" do
                expect(chama_one).to be_valid
            end
        end
    end

    describe 'Associations' do
        it { should belong_to(:admin).class_name('User').with_foreign_key('user_id') }
        it { should have_many(:users).through(:chama_memberships) }
    end
end

