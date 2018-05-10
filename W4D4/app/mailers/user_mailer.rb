class UserMailer < ApplicationMailer
  default from: "App Academy <contact@appacademy.io>"

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/session/new'
    mail(to: user.username, subject: 'Welcome to cats')
  end
end
