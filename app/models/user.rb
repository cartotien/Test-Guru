class User < ApplicationRecord
  validates :name, :email, presence: true

  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  def test_passages_by_level(level)
    tests.where(level: level)
  end
end
