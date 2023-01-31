class LoginController < ApplicationController

    skip_before_action :authenticate_request

    def Login
        @chama = Chama.find_by(email: params[:email])
        if @chama&.authenticate(params[:password])
            token = jwt_encode(chama_id: @chama.id)
            render json: { token: token }, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end

    end
end