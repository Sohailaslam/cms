class VisitorMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        @url  = 'http://example.com/login'
        mail(from: "noreply@systemplus.com.pk", to: @user.email, subject: 'Thank You '+ @user.name + ' for visiting our stall')
      end
end
