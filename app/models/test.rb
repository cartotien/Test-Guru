class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  def self.by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where('categories.title LIKE ?', category)
      .order(title: :desc)
      .pluck(:title)
  end
end
