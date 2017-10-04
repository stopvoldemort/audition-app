class ActorMailer < ApplicationMailer

  default from: "admin@stagefast.com"
  layout 'mailer'

  def audition_email(user)
    @user = user
    mail(to: @user.email)
  end

  def cast_email(user)
    @user = user
    mail(to: @user.email)
  end






end
