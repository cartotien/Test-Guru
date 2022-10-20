class TestPassage < ApplicationRecord
  CORRECT_QUESTIONS_RATIO = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: "Question", optional: true
  before_update :before_update_set_successful
  before_save :before_save_set_question
  after_save :set_badges, if: :completed_and_successful?

  scope :successful_passages, -> { where(successful: true) }
  scope :correct_tests_within_category, ->(category) { successful_passages.includes(test: :category).where(category: { title: category })}
  scope :correct_tests_within_level, ->(level) { successful_passages.includes(:test).where(test: { level: level }) }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def successful?
    correct_question_percentage >= CORRECT_QUESTIONS_RATIO
  end

  def completed_and_successful?
    successful? && completed?
  end

  def correct_question_percentage
    correct_questions.to_f / test.questions.count * 100
  end

  def current_question_number
    number_of_questions - next_questions.count
  end

  def number_of_questions
    test.questions.count
  end

  protected

  def set_badges
    BadgeService.new(self).call
  end

  def first_question
    test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def next_question
    next_questions.first
  end

  def before_save_set_question
    return self.current_question = first_question if current_question.nil?

    self.current_question = next_question
  end

  def before_update_set_successful
    self.successful = true if completed? && successful?
  end
end
