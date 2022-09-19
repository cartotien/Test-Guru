class User < ApplicationRecord
  def user_tests(level)
    Test.joins('JOIN test_passages ON test_passages.test_id = tests.id')
        .where('test_passages.user_id': id, level: level)
  end
end
