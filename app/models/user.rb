class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages
  has_many :tests, through: :test_passages

  def user_tests(level)
    tests.where(level: level)
  end
end
