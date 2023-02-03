class UserMailer < ApplicationMailer
    default from: 'okerioh@gmail.com'

    def verification
        @user = params[:user]
        mail(to: @user.email, subject: 'Welcome to Virtual Chama')
    end
end
