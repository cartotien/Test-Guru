class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :cannot_have_more_than_four_answers, on: :create

  scope :correct, -> { where(correct: true) }

  protected

  def cannot_have_more_than_four_answers
    errors.add(:question, "can't have more than 4 answers") if question.answers.count >= 4
  end
end
