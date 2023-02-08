require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do

    before :each do
        @user = User.create(first_name: 'John', last_name: 'Doe', phone: '0712345678', email:"John@gmail.com", password: "password",status: 1)
        @token = log_in(@user)
    end

    let(:user1) {{
        "first_name" => "Faith",
        "last_name" => "Kemunto",
        "phone" => "0787654322",
        "email" => "kemunto@gmail.com",
        "password" => "kemunto",
        "password_confirmation" => "kemunto",
        "avatar_url" => "https://www.google.com"
    }}

    describe 'Actions for User' do
        it "should show a user" do
            get_request "/api/v1/users/#{@user.id}", @token
            expect(response).to have_http_status(:success)
        end

        it "should create a user" do
            register_request "/api/v1/users", user1
            expect(response).to have_http_status(:created)
        end
    end


end
