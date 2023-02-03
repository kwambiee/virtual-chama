class ApplicationController < ActionController::API
    include JsonWebToken
    skip_before_action :authenticate_request, only: [ :email_verification]
    before_action :authenticate_request

    def email_verification
        user = User.find_by_confirm_token(params[:id])
        if user
          user.verified!
          redirect_to "https://google.com", allow_other_host: true
        else
          redirect_to "https://github.com/kwambiee/virtual-chama", allow_other_host: true
        end
    end
    private

    def authenticate_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        decoded = jwt_decode(header)
        @current_user = User.find(decoded[:user_id])
    rescue
        render json: { error: 'unauthorized' }, status: :unauthorized
    end

end
