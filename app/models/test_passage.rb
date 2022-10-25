class TestPassage < ApplicationRecord
  CORRECT_QUESTIONS_RATIO = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: "Question", optional: true
  before_save :before_save_set_question

  scope :successful_passages, -> { where(successful: true) }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    set_successful
    save!
  end

  def completed?
    current_question.nil? || timer_passed?
  end

  def successful?
    correct_question_percentage >= CORRECT_QUESTIONS_RATIO
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

  def timer_passed?
    time_left <= 0
  end

  def time_left
    timer_deadline.to_i - Time.zone.now.to_i
  end

  def timer_deadline
    created_at.to_i + test.timer
  end

  protected

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

  def set_successful
    self.successful = true if completed? && successful?
  end
end
