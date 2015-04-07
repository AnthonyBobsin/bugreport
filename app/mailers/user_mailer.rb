class UserMailer < ApplicationMailer
  default from: 'notifications@bugreport406.com'

  def bug_submit(user, bug)
    @user = user
    @bug = bug
    @url = 'http://bugreport406.herokuapp.com'
    mail(to: @user.email, subject: 'Thanks for Submitting!')
  end

  def bug_closed(user, bug)
    @user = user
    @bug = bug
    @url = 'http://bugreport406.herokuapp.com'
    mail(to: @user.email, subject: 'Your Bug has been Closed!')
  end

end
