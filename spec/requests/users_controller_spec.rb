require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do

    before :each do
        @user = create(:user)
        @token = log_in(@user)
    end

    let(:user_params) do
        {
            first_name: "Pauline",
            last_name: "Kwamboka",
            phone: "+254710607261",
            password: "qwerty",
            email: "pame@gmail.com"
        }
    end

    describe 'Actions for User' do
        it "should show a user" do
            get_request "/api/v1/users/#{@user.id}", @token
            expect(response).to have_http_status(:success)
        end

        it "should create a user" do
            register_request "/api/v1/users", {user: user_params}
            expect(response).to have_http_status(:created)
        end
    end


end
