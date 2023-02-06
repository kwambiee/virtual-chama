class LoginController < ApplicationController
    skip_before_action :authenticate_request, only: [:login, :email_verification]

    def login
        @user = User.find_by(email: params[:email])
        if @user&.authenticate(params[:password])
            if @user.verified?
                token = jwt_encode(user_id: @user.id)
                render json: { token: token }, status: :ok
            else
                render json: { error: 'Please verify your account by following the
        instructions in the account confirmation email you received to proceed' }, status: :unauthorized
            end
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end

    def email_verification
        user = User.find_by_confirm_token(params[:token])
        if user
          user.verified!
          redirect_to "https://google.com", allow_other_host: true
        else
          redirect_to "https://github.com/kwambiee/virtual-chama", allow_other_host: true
        end
    end


end