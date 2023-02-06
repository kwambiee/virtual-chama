class Api::V1::ChamaMemberships < ApplicationController

    before_action :set_chama_membership, only: [:show, :update, :destroy]

    def index
        @chama_memberships = ChamaMembership.all
    end

    def create
        @chama_membership = ChamaMembership.new(chama_membership_params)
        if @chama_membership.save
            UserMailer.with(user: @current_user, chama: @chama_membership.chama).chama_membership_request.deliver_later
            UserMailer.with(admin: @chama_membership.chama.admin, chama: @chama_membership.chama).admin_confirmation.deliver_later
            render json: @chama_membership, status: :created
        else
            render json: @chama_membership.errors, status: :unprocessable_entity
        end
    end

    def update
        @chama_membership = ChamaMembership.find(params[:id])
        if params[:status] == "approved"
            @chama_membership.update(status: "approved")
            UserMailer.with(user: @chama_membership.user, chama: @chama_membership.chama).chama_membership_approved.deliver_later
            render json: @chama_membership, status: :created
        elsif params[:status] == "rejected"
            @chama_membership.update(status: "rejected")
            UserMailer.with(user: @chama_membership.user, chama: @chama_membership.chama).chama_membership_rejected.deliver_later
            render json: @chama_membership, status: :created
        else
            render json: @chama_membership.errors, status: :unprocessable_entity
        end


    end

    private

    def set_chama_membership
        @chama_membership = ChamaMembership.find(params[:id])
    end

    def chama_membership_params
        params.require(:chama_membership).permit(:user_id,:chama_id)
    end


end