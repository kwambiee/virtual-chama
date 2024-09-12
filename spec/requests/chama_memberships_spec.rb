require 'rails_helper'

RSpec.describe Api::V1::ChamaMembershipsController, type: :request do
    before :each do
        @user = create(:user)
        @chama = create(:chama, admin: create(:user))
    end

    describe 'Actions for User' do
        it "should create a chama membership" do
            token = log_in(@user) 
            post_request "/api/v1/chama_memberships", token, {chama_id: @chama.id}
            expect(response).to have_http_status(:success)
        end      
    end
end