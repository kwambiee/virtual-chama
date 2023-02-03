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
        render json: {message: "Please confirm your email address to continue" }, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
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
