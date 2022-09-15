class User < ApplicationRecord
  def user_tests(level)
    Test.joins('JOIN users ON tests.author_id = users.id')
        .where('author_id = ? AND level = ?', id, level)
  end
end