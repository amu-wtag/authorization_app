class UserMailer < ApplicationMailer
    # URL helpers (confirmation_url in this case) are usually available in controllers and views,
    # but not in mailers by default. This is because mailers don’t automatically have
    # access to the same helper methods that controllers do.
    include Rails.application.routes.url_helpers

    default from: 'ahnaf.muttaqi@welldev.io'

    def welcome_email(user)
        # @user = user
        # # @url  = 'http://example.com/login'
        # @url  = sessions_login_url
        # mail(to: @user.email, subject: 'Welcome to My Awesome Site')
        # # mail(to: @user.email, subject: 'Welcome to My Awesome Site', template_name: 'new_email_template')

        @user = user
        @confirmation_url = confirmation_url(token: @user.confirmation_token)
        mail(to: @user.email, subject: "Confirm your email address")
    end

    def password_reset(user)
        @user = user
        @reset_url = edit_password_reset_url(user.reset_token, email: user.email)
        mail(to: @user.email, subject: 'Password Reset')
    end

    # def confirmation_email(user)
    #     @user = user
    #     @confirmation_url = confirmation_url(token: @user.confirmation_token)
    #     mail(to: @user.email, subject: "Confirm your email address", template_name: 'welcome')
    # end
end
