class FeedbacksController < ApplicationController
  def new
    @feedback = current_user.feedbacks.build
  end

  def create
    @feedback = current_user.feedbacks.build(feedback_params)
    if @feedback.save
      FeedbackMailer.feedback(@feedback).deliver_now
      redirect_to root_path, notice: t('.success')
    else
      render :new
    end
  end

  protected

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end
end
