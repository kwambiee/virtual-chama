require 'rails_helper'

RSpec.describe Api::V1::ChamasController, type: :request do

        let (:user)  { User.create(first_name: 'John', last_name: 'Doe', phone: '0712345678', email:"John@gmail.com", password: "password",status: 1) }
        let (:token) { log_in(user) }

        let (:chama_one) { Chama.create(name: "Kibera group", reg_no: "BU-08", username: "Kibera", admin: user) }

        let(:chama_params) do
             {name: "Malla foundation", reg_no: "MA-01", username: "Malaa"}
        end

    describe 'Actions for Chama' do
        it "should show all chamas" do
            get_request "/api/v1/chamas", token
            expect(response).to have_http_status(:success)
        end

        it "should show a chama" do
            get_request "/api/v1/chamas/#{chama_one.id}", token
            expect(response).to have_http_status(:success)
        end

        it "should create a chama" do
            post_request "/api/v1/chamas", token, {chama: chama_params}
            expect(response).to have_http_status(:created)
        end

    end


end
