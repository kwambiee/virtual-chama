class Api::V1::UsersController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_user, only: [:show, :update, :destroy]

    def show
        render json: @user
    end

    def create
      @user = User.new(user_params)
      if @user.save
        UserMailer.with(user: @user).verification.deliver_later
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
          user.email_activate
          flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
          Please sign in to continue."
          redirect_to signin_url
        else
          flash[:error] = "Sorry. User does not exist"
          redirect_to root_url
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :avatar_url)
    end
end
