require 'rails_helper'

RSpec.describe LoginController, type: :request do
    let(:user) { create(:user) }

    let(:valid_params) do
        {
            email: user.email,
            password: user.password
        }
    end

    let(:invalid_params) do
        {
            email: user.email,
            password: 'qwerty'
        }
    end
    
    context 'with valid credentials' do
        # before do
        #     post '/login', params: valid_params
        # end
        it 'returns auth token with status 200' do
            # binding.pry
            log_in(user)
            expect(response).to have_http_status(200)
        end
    end
    context 'with invalid credentials' do
        before do
            post '/login', params: invalid_params
        end
        it 'returns unauthorized' do
            expect(response).to have_http_status(:unauthorized)
        end
    end

end