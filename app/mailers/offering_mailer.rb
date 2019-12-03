class OfferingMailer < ApplicationMailer
    default from: "StudyBuddy1011@heroku.com"

    def booking_email
        @user = params[:user]
        @offering = params[:offering]
        # @url = "http://localhost:3000/offerings/"
        @url = " https://study-buddy1011.herokuapp.com/offerings"
        mail(to: @user.email, subject: 'Booking confirmed!')
    end
end
