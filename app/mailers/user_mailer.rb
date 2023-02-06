class UserMailer < ApplicationMailer
    default from: 'okerioh@gmail.com'

    def verification
        @user = params[:user]
        mail(to: @user.email, subject: 'Welcome to Virtual Chama')
    end

    def chama_membership_request
        @user = params[:user]
        @chama = params[:chama]
        mail(to: @user.email, subject: 'Chama Membership Request')
    end

    def admin_confirmation
        @admin = params[:admin]
        @chama = params[:chama]
        mail(to: @admin.email, subject: 'Chama Membership Request')
    end

    def chama_membership_approved
        @user = params[:user]
        @chama = params[:chama]
        mail(to: @user.email, subject: 'Chama Membership Approved')
    end

    def chama_membership_rejected
        @user = params[:user]
        @chama = params[:chama]
        mail(to: @user.email, subject: 'Chama Membership Rejected')
    end

end
