class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :test_passages, foreign_key: :current_question, dependent: :destroy
  has_many :current_questions, through: :test_passages
  has_many :gists, dependent: :destroy
  has_many :questions, through: :gists

  validates :body, presence: true
end
