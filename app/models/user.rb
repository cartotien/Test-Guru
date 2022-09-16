class User < ApplicationRecord
  def user_tests(level)
    tests.where('level = ?', level)
  end

  has_and_belongs_to_many :tests
end
