class FeedbackMailer < ApplicationMailer
  def feedback(feedback)
    @feedback = feedback
    set_admin

    mail to: @admin.email, from: @feedback.user.email, subject: "TestGuru Feedback"
  end

  protected

  def set_admin
    @admin = User.find_by(type: 'Admin')
  end
end
