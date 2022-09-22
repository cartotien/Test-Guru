class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :name, :email, presence: true

  def passed_tests_by_level(level)
    tests.where(level: level)
  end
end
