class RegistrationController < ApplicationController

    def create
        @chama = Chama.new(chama_params)
        if @chama.save
            render json: @chama, status: :created
        else
            render json: @chama.errors, status: :unprocessable_entity
        end
    end

    private

    def chama_params
        params.permit(:name, :reg_no, :logo_url, :username, :email, :password_digest, :phone)
    end
end