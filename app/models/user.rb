class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages
  has_many :tests, through: :test_passages

  def user_tests(level)
    Test.joins('JOIN test_passages ON test_passages.test_id = tests.id')
        .where('test_passages.user_id': id, level: level)
  end
end
