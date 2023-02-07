require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { build(:user) }

    describe 'Validates presence of' do
        [:first_name, :last_name, :phone, :email].each do |field|
            it { should validate_presence_of(field) }
        end
    end

    describe 'Validates uniqueness of' do
        [:phone, :email].each do |field|
            it { should validate_uniqueness_of(field) }
        end
    end

    describe "Associations" do
        it {should have_many(:created_chamas).class_name('Chama')}
        it {should have_many(:chamas).through(:chama_memberships)}
    end
end
