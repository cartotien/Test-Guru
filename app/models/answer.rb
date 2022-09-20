class Answer < ApplicationRecord
  validates :body, presence: true
  validate :cannot_have_more_than_four_answers, on: :create

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  protected

  def cannot_have_more_than_four_answers
    errors.add(:question, "can't have more than 4 answers") if question.answers.count >= 4
  end
end
